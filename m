Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EEE3FC837
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 15:28:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzSgJ180yz2yfZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 23:28:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UoT8zmYe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UoT8zmYe; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzSfZ5q4xz2xff
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 23:27:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GzSfX47f5z9sPf;
 Tue, 31 Aug 2021 23:27:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630416452;
 bh=tD1uZaDve7EZroohLNn4D8QyG0YeYmVbsWpipwg4GNM=;
 h=From:To:Cc:Subject:Date:From;
 b=UoT8zmYezriiNadKvyfHguVRZVk+fil6bdzaYjpMdppSeOv66x7Rp0WrgpjeF9nyE
 uEhOu3IxNw3jDo4uvMuOLXsTTLyU8xmNN42ps6eWrFuBM9IlhnW6bmcE4TjlUKsxBz
 hECsqzpAYg87XTMJmF/xMSCWR6boyfdZkOqph6pn0CvsyRQjjwIGSZm0mfg+ojzW2M
 JrlvvU53lYcUKWI3qLj/eLs3KXglXgWsNDzEW8q48PZBYTUJbciEUoExtUaIaK5fgj
 Lwj7auUPHFrlx4zyARoxkDr39wFWQLhcX0QuSFS0v8De1dkL+0ZQVqS/rRYkv4szoA
 VAwAXFbSTBf8A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/bug: Cast to unsigned long before passing to inline
 asm
Date: Tue, 31 Aug 2021 23:27:20 +1000
Message-Id: <20210831132720.881643-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: nathan@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit 1e688dd2a3d6 ("powerpc/bug: Provide better flexibility to
WARN_ON/__WARN_FLAGS() with asm goto") we changed WARN_ON(). Previously
it would take the warning condition, x, and double negate it before
converting the result to int, and passing that int to the underlying
inline asm. ie:

  #define WARN_ON(x) ({
  	int __ret_warn_on = !!(x);
  	if (__builtin_constant_p(__ret_warn_on)) {
  	...
  	} else {
  		BUG_ENTRY(PPC_TLNEI " %4, 0",
  			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),
  			  "r" (__ret_warn_on));

The asm then does a full register width comparison with zero and traps
if it is non-zero (PPC_TLNEI).

The new code instead passes the full expression, x, with some unknown
type, to the inline asm:

  #define WARN_ON(x) ({
	...
	do {
		if (__builtin_constant_p((x))) {
		...
		} else {
			...
			WARN_ENTRY(PPC_TLNEI " %4, 0",
				   BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),
				   __label_warn_on, "r" (x));

This was not seen to cause any issues with GCC, however with clang in at
least one case it leads to a WARN_ON() that fires incorrectly and
repeatedly at boot, as reported[1] by Nathan:

  WARNING: CPU: 0 PID: 1 at lib/klist.c:62 .klist_add_tail+0x3c/0x110
  Modules linked in:
  CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.14.0-rc7-next-20210825 #1
  NIP:  c0000000007ff81c LR: c00000000090a038 CTR: 0000000000000000
  REGS: c0000000073c32a0 TRAP: 0700   Tainted: G        W          (5.14.0-rc7-next-20210825)
  MSR:  8000000002029032 <SF,VEC,EE,ME,IR,DR,RI>  CR: 22000a40  XER: 00000000
  CFAR: c00000000090a034 IRQMASK: 0
  GPR00: c00000000090a038 c0000000073c3540 c000000001be3200 0000000000000001
  GPR04: c0000000072d65c0 0000000000000000 c0000000091ba798 c0000000091bb0a0
  GPR08: 0000000000000001 0000000000000000 c000000008581918 fffffffffffffc00
  GPR12: 0000000044000240 c000000001dd0000 c000000000012300 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR24: 0000000000000000 c0000000017e3200 0000000000000000 c000000001a0e778
  GPR28: c0000000072d65b0 c0000000072d65a8 c000000007de72c8 c0000000073c35d0
  NIP .klist_add_tail+0x3c/0x110
  LR  .bus_add_driver+0x148/0x290
  Call Trace:
    0xc0000000073c35d0 (unreliable)
    .bus_add_driver+0x148/0x290
    .driver_register+0xb8/0x190
    .__hid_register_driver+0x70/0xd0
    .redragon_driver_init+0x34/0x58
    .do_one_initcall+0x130/0x3b0
    .do_initcall_level+0xd8/0x188
    .do_initcalls+0x7c/0xdc
    .kernel_init_freeable+0x178/0x21c
    .kernel_init+0x34/0x220
    .ret_from_kernel_thread+0x58/0x60
  Instruction dump:
  fba10078 7c7d1b78 38600001 fb810070 3b9d0008 fbc10080 7c9e2378 389d0018
  fb9d0008 fb9d0010 90640000 fbdd0000 <0b1e0000> e87e0018 28230000 41820024

The instruction dump shows that we are trapping because r30 is not zero:
  tdnei   r30,0

Where r30 = c000000007de72c8

The WARN_ON() comes from:

  static void knode_set_klist(struct klist_node *knode, struct klist *klist)
  {
  	knode->n_klist = klist;
  	/* no knode deserves to start its life dead */
  	WARN_ON(knode_dead(knode));
  		^^^^^^^^^^^^^^^^^

Where:

  #define KNODE_DEAD		1LU

  static bool knode_dead(struct klist_node *knode)
  {
  	return (unsigned long)knode->n_klist & KNODE_DEAD;
  }

The full disassembly shows that the compiler has not generated any code
to apply the "& KNODE_DEAD" to the n_klist pointer, which is surprising.

Nathan filed an LLVM bug [2], in which Eli Friedman explained that "if
you pass a value of a type that's narrower than a register to an inline
asm, the high bits are undefined". In this case we are passing a bool
to the inline asm, which is a single bit value, and so the compiler
thinks it can leave the high bits of r30 unmasked, because only the
value of bit 0 matters.

Because the inline asm compares the full width of the register (32 or
64-bit) we need to ensure the value passed to the inline asm has all
bits defined. So fix it by casting to long.

We also already cast to long for the similar case in BUG_ENTRY(), which
it turns out was added to fix a similar bug in 2005 in commit
32818c2eb6b8 ("[PATCH] ppc64: Fix issue with gcc 4.0 compiled kernels").

[1]: http://lore.kernel.org/r/YSa1O4fcX1nNKqN/@Ryzen-9-3900X.localdomain
[2]: https://bugs.llvm.org/show_bug.cgi?id=51634

Fixes: 1e688dd2a3d6 ("powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() with asm goto")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/bug.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 1ee0f22313ee..02c08d1492f8 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -119,7 +119,8 @@ __label_warn_on:						\
 								\
 			WARN_ENTRY(PPC_TLNEI " %4, 0",		\
 				   BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
-				   __label_warn_on, "r" (x));	\
+				   __label_warn_on,		\
+				   "r" ((__force long)(x)));	\
 			break;					\
 __label_warn_on:						\
 			__ret_warn_on = true;			\

base-commit: e1ab9a730b426fadc018f91b7c98412473e542fb
prerequisite-patch-id: 942553bda7d83bbae8bf6b2b718033d488ee2410
prerequisite-patch-id: a14c44e671eba8648c4fe385a2552fd57875ec8a
prerequisite-patch-id: 94f5c890f54da2b46f06c60562e879171fab2be3
prerequisite-patch-id: 330af32f2aa34a432d450acc9f6e9fd1cec96417
prerequisite-patch-id: b46c65afa63944f3fb02f4b9bdf940507bb25de6
prerequisite-patch-id: c4ba00ee949f70d7745f75bad11bbb2416f329f1
prerequisite-patch-id: f479601944d0aa615716d5349d93bd6e3d5619c1
prerequisite-patch-id: 9523cde933393b2d68648cecb740efdba9dd8601
prerequisite-patch-id: 034afc97c841a6dcd2b9932406f391d65d18bf87
prerequisite-patch-id: effd7ac8a7db6b59a2677c9c3a7ef8b3ef8bdaf8
prerequisite-patch-id: 23883cf116ee69b452db3c6e10dd49e756e7b5d5
prerequisite-patch-id: 37b6695321c96db466b0faba9308bacfb79c7ced
prerequisite-patch-id: 83420e68ca4476c9ba5a67aa19e1fdc0b6d656a4
prerequisite-patch-id: 362219acf820b78b83c6c09071a636b28976a1ce
prerequisite-patch-id: 857513c5f431887d16a59d193834dcec636c73dc
prerequisite-patch-id: 49f6879a819e205b5361280ab923664fcd29daaf
prerequisite-patch-id: 5a37bcf70c5cb44d78de63a64e5ce920a0a7e419
prerequisite-patch-id: 2c06dd3833117b0498baa198694f6c7e84975840
prerequisite-patch-id: 5794a211ebbf7f0d416ae882443201621c00f615
prerequisite-patch-id: 19ed5ae34e233079c7f66376b8d309cac2b57dbc
prerequisite-patch-id: 1d4c82277473e8dbecf83faf6c4a6788538b064d
prerequisite-patch-id: 8cb5ecc4fe23dafb4a43192f93b669c80a548985
prerequisite-patch-id: 763b8d98c3aefd120862154b94814e3ef3578b5c
prerequisite-patch-id: f45e04e6d030eb157be550976b07dc891fa0836d
prerequisite-patch-id: 07b6fb682675845aca694deff1847bc7a40e1fec
prerequisite-patch-id: 7f1082effa12b1eba445cef90e4749155662888c
prerequisite-patch-id: 76743814dd8e6151c27676ae2e318579d658bf8b
prerequisite-patch-id: 8a6b12c11dbbcd5dda0ccc9877dee1be785e0173
prerequisite-patch-id: e98f013ce41c27d16f75ac3eb1c7eec4235cca0a
prerequisite-patch-id: 285e11f96169ec82702a69b2fca5318c0e307508
prerequisite-patch-id: 9fa89fb9f4ac839177307891bb240009f1d55e88
prerequisite-patch-id: feebaed3f6e0c15e8fa468d64129fe9aa4411d57
prerequisite-patch-id: 8f1093cf40180a623439d82e563e1dd18194cc19
prerequisite-patch-id: d0466662674595d0678e71e5258d55b93d54b5c4
prerequisite-patch-id: 286812aaed6630139583fd21d388137b8d5a6931
prerequisite-patch-id: 54af8aa735a12282bb40a0ed87455e268ae356d9
prerequisite-patch-id: cc5ee85759d99a6ebf18e39634dde65f15476f84
prerequisite-patch-id: 3f8437c8bfda23c45839596ec432d81a95505061
prerequisite-patch-id: f30d6fa2c7c7c417ee4bee0827c0ce587570db34
prerequisite-patch-id: fa402f5deaa301587ced629dfa523728aece4705
prerequisite-patch-id: 51f326f5de947cea58003cc8b988b54436689d1b
prerequisite-patch-id: 4003c9a6b2792e797c333875e63a184df8fcc7e7
prerequisite-patch-id: f73fd878eb9b65ecbed3c3ee8ca6725f7e55d5d2
prerequisite-patch-id: 5e55b3e9b3809da22b8742f0ed356df6d6fdd301
prerequisite-patch-id: 1fde98fffabd6313d1921d8b2f28691e9a191b1d
prerequisite-patch-id: 51c0595fe54ad077c736b7a4351c2f2700ab66d7
prerequisite-patch-id: e490360db8c2dc7cbf693258ca93e4597f165c6f
prerequisite-patch-id: c4354b3226d31d8ddb6992956cf0ed12ea97cb8e
prerequisite-patch-id: c67a26ed658da4b11a3319e0e99c4a84afb68d80
prerequisite-patch-id: a7165946b90250fe64f5fd89502c8b681ceb081c
prerequisite-patch-id: 5d08a5118d0f54a376d9391db767a54a15af9007
prerequisite-patch-id: 17f4db4239b3cdeed1c73fc7949fb88486670253
prerequisite-patch-id: 6bbbe2843772c041816d424e8d413c78d1296167
prerequisite-patch-id: 2e08a0fa85e090442cad0d6570fbdcda6ba77e52
prerequisite-patch-id: 4a6da55322b1e84315f0358890df7c1160f3bb76
prerequisite-patch-id: 66ef17a0eb92d9756f05f9ea43066d794b878db1
prerequisite-patch-id: 504a94de0570b8f6e509fad140088543edfab60d
prerequisite-patch-id: 254030d04e05a4f8275850705976bce02947e334
prerequisite-patch-id: cbf69c10f9d79b3902e87190c6abcc6ad05146d6
prerequisite-patch-id: 65d12c13deecc37aacb6bcbee69e65353032f672
prerequisite-patch-id: d1361cfe1939801bd397f89958b43899be233cec
prerequisite-patch-id: db8ea3183bc27e148f84482d75a7d835d94cedd7
prerequisite-patch-id: 1974681313eaa98eb00464056d64aad1a3816237
prerequisite-patch-id: 24ef0746bc6b7503e9a8f75754b786fb315c4f2d
prerequisite-patch-id: 24d2ca0fb3c90a57fed495c2fb17f86447e04860
prerequisite-patch-id: 6f1ca0ce4f9f8b65a56765bd31386decac28e9ea
prerequisite-patch-id: 1715a4e4bbd75871049978b5551837b22f6263bb
prerequisite-patch-id: 30c74cfb31b65e120611cb28ec8f0d79e0b9804e
prerequisite-patch-id: 339583602a8c734ad1708d92a2d7af32284d1215
prerequisite-patch-id: 22fc0eb9e2b45e62cc473bd43a51bb941d419063
prerequisite-patch-id: 84cb7b5a209feedd520150c7193124cc1f9c80d7
prerequisite-patch-id: ef807430dbb9e43cff53087a8d62767ce1d91ae1
prerequisite-patch-id: 3b7b1f05efba0907f9a6d217ff67d2fdbd99df99
prerequisite-patch-id: a991327b6eff6be015e345962707fabd6fd4227c
prerequisite-patch-id: 26b68754714f850a7e9c80490a2f1bd67faf3529
prerequisite-patch-id: 6638b702ed937493bfe7aa47af628f4f15549b73
prerequisite-patch-id: c7dfcf376999604a0ccdc26dd2ffa4445f92e3c1
prerequisite-patch-id: 14849c2c4012cc133be0db3eabcefb3f318ca342
prerequisite-patch-id: fa197269ec80c97d03a750667db30bd5887bed54
prerequisite-patch-id: 0e470afd61f97d5d7c08ebf515934ac1ec4e748e
prerequisite-patch-id: 35b8e958c05de8b7005293b0cf217293a9eeaa58
prerequisite-patch-id: 9bac761d812645c0aa485c4d2d9eed340ab11f0a
prerequisite-patch-id: 01834ee99459f3c861da4910753b6480fe827dab
prerequisite-patch-id: 4859596f0522be112f41e2f69c6f90c39bc967dd
prerequisite-patch-id: 08c3397e11ef439e85a7bca2089a30016d36ea0e
prerequisite-patch-id: fa5507ab30165df410e22d5c22de0537bb4ded59
prerequisite-patch-id: 869dce1db9832c582994c6ed6f751b07b48125d1
prerequisite-patch-id: 324bc707b7f150a18fab383536515aa833855ced
prerequisite-patch-id: e88296896fb188f7c472c1dc53dbd367a230487b
prerequisite-patch-id: 5ab1cbfb81aa91f5e81b3deb014cc0c21ec1bab5
prerequisite-patch-id: cb4615af3de52eff7224280e92ad4758fc0c3343
prerequisite-patch-id: 0237d4817f895c5ddbb36df05efc4f91d9edffc4
prerequisite-patch-id: 6a110281aac979dec5e2e71f909fce1212278977
prerequisite-patch-id: ee3b2d2acffd08a33c1217b658f8c88b876e35c4
prerequisite-patch-id: 12b29eccf400cea67a55c74b56e577f49834047e
prerequisite-patch-id: e29ebe2684a71e790a58f62085190a813ae5a5f1
prerequisite-patch-id: d1e8c04f704e47bc8a3b614b6a385c01e25f4ff3
prerequisite-patch-id: 87cb9aa0f7e7fbcdaaa6a2d62ccfe185b861c4e6
prerequisite-patch-id: 22883bca2200f42c0024bdf1d8543375e699557f
prerequisite-patch-id: 336e23cd5be248bdc0787ce164582cb371d97657
prerequisite-patch-id: b11f7ac383774f86e86f6ae517b65c8c065c5797
prerequisite-patch-id: f2c6c9391594477ce4f655d8b51d82ab0526fa3b
prerequisite-patch-id: a045c2861288933be9c4cd1100e786b18843ebb7
prerequisite-patch-id: 3a3cadbe351e63f3403a127d24ee9c5b142ec15c
prerequisite-patch-id: 326bdc5846c89345e7a222ade9ec17c3bd62b3d0
prerequisite-patch-id: 401ccfc11e13f684b88a7287296fad1569c9b25e
prerequisite-patch-id: dd09a722c66ab1ba63c2203d520ba090c29c8283
prerequisite-patch-id: 89804991ad73df809315885d92d97f4109234573
prerequisite-patch-id: c94655023a07fbb27dfd12b5dca0758f64a1cc4c
prerequisite-patch-id: f9762f94fb9fa39deef961626e938925837e8c4c
prerequisite-patch-id: cdbec35dbdd3ce2f6e17c9595976ff128f029ec1
prerequisite-patch-id: 503b7d6e7369f31241a3705a52d036e135599602
prerequisite-patch-id: 489404df41c4e8bd6cc353d2eb8f714a7f7cb95d
prerequisite-patch-id: 530df13ef25239dc259319098336dcebd6cc87de
prerequisite-patch-id: a246c487a84b9a4932dc7ce77d4f9606afe7b85c
prerequisite-patch-id: 393087a4e9f1a0a09be0343ff94925d17c4082ca
prerequisite-patch-id: 89a56b4c9349d123dea13732015671e1aeb62b18
prerequisite-patch-id: eb86942c6da6188efea6c6d67c6bdd60339e0476
prerequisite-patch-id: afa740a40e3b07e5a9378918d725e5802167bdc1
prerequisite-patch-id: e342e49df2157001bf6322211e75fe025786e30a
prerequisite-patch-id: b3c799971c5da26f68f07028496a2eeb3bdaaf33
prerequisite-patch-id: a735a743d7661d448ee6d124166298eae0ddf0e2
prerequisite-patch-id: 510af96fd5e0fd92151b3a8b541f376792c39bec
prerequisite-patch-id: a13a33ba2b519bfc40ff4997fa845b63d3653f39
prerequisite-patch-id: c7df3d67d6395d33bd9751de80b55568f3fb6186
prerequisite-patch-id: b258c071f38b60baf1030f8151ea94fe75a662bf
prerequisite-patch-id: 2692c2e15a9895ee28ea5ce3f5028dfcbd25594d
prerequisite-patch-id: 48709efeb5030256d124df36025e5bcc850d45b7
prerequisite-patch-id: 6e9724110834a8337ea4c6792fd65b5c9d468d3c
prerequisite-patch-id: d0250201c811f6f0428a3806bd5103c58b4e1e83
prerequisite-patch-id: 1cb3e528643b493849ac4d1053261de195f410ad
prerequisite-patch-id: a8d02c6e093c2a1239c134adab5b52bfe1b2a402
prerequisite-patch-id: 38cd600a6d248b1962fb13c1bbf141bb95927f88
prerequisite-patch-id: 7877ab5caf1d61e3dc3e4d1d4cdf09b102232e6c
prerequisite-patch-id: 843bf6118787a648ebd0ee8d419d19e89f771ea3
prerequisite-patch-id: 9a446cb0a9d212fc8ce5e3946a946ae39c2c349f
prerequisite-patch-id: 8ac1f15124b2bd0d270e3663056c0f0cc1cb0ec8
prerequisite-patch-id: 2c62e90eb7cd826b7206bf17cb307a63173535cb
prerequisite-patch-id: b7683837ef6de9540e4c1b584b5f7f09f5a93462
prerequisite-patch-id: 8229a9ffdf02c2387bca160368c0c979a8195dbf
prerequisite-patch-id: 6996c60bfe5146e4a249d1eae10eff826cfc4d7f
prerequisite-patch-id: bf13ed36a4a78760e89139117b900ab575f7e580
prerequisite-patch-id: 195c4cbcf2370dcfa843c8b12bb733a4b1b5e8de
prerequisite-patch-id: 4e0506e90c3ca82e30d058761e1a529b37924274
prerequisite-patch-id: 21ff6da108be555677f80188b31e22a1e72926b8
prerequisite-patch-id: 4644fd201040a92da4e8d2b2b63d903595614ab6
prerequisite-patch-id: 9a09071502e021e0b537c934e45b21221daef912
prerequisite-patch-id: fe8d55d4361067ca36e5826fd953c2211d4681e7
prerequisite-patch-id: b177aae7e5f05b53b5f31f754a24492d85b8b4e8
prerequisite-patch-id: 98f78c471a07fdc399d7d92041b3208a9228f627
prerequisite-patch-id: d59f939e25301f9ee72f79b3c63cbc90b872743a
prerequisite-patch-id: 727952f4af1baf3b0f53aa275f2bcd13a03dc270
-- 
2.25.1

