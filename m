Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F83A7B515C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 13:30:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fn0CgrJ+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzdzM3CcXz3vYL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 22:30:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fn0CgrJ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+j.granados.samsung.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzdyS5tSfz3cQx
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Oct 2023 22:29:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 82D22CE0E6A;
	Mon,  2 Oct 2023 11:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE660C433C8;
	Mon,  2 Oct 2023 11:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696246156;
	bh=MwyhsMB+QNewgFpXxkXQmsvWEhsqf6iwRapvTWMJ570=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Fn0CgrJ+v6cL9vTYhKPg6OgOQaWRJTgXBVaO3ScxrD4gg9wt/Z2mshZ1VhMdPcdcf
	 mIIM2omKRuIMrqv6YA+hQwx9xrKq1qs06T8QOmwfVO7AtrxYd5rh1r+kUPzwcyu797
	 18h2bcpjlToTVnAwdi9CPaHalg4EJ7Zim/e0s2FhMSYoM8hyOCI5Phm402xOhfu8Ur
	 LiKg5xJ0xnNxxaRejYqvlII9lnTi1FkpRgqdrWXDnBQ+HjwEbDqnGv59Y5t7b4Rn9N
	 JYXDpn53dtNWvO8DQecGI4swx2VXECfeiVdNJVDHuvWH/N+eg+R3bBaUJcDaSVaueh
	 ImgixOauByldQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87905E784A4;
	Mon,  2 Oct 2023 11:29:16 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Subject: [PATCH v3 0/7] sysctl: Remove sentinel elements from arch
Date: Mon, 02 Oct 2023 13:30:35 +0200
Message-Id:  <20231002-jag-sysctl_remove_empty_elem_arch-v3-0-606da2840a7a@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANupGmUC/43NTQqDMBhF0a1Ixk3Jn6IddR+lSEy+aooxkthQE
 ffeKBTamcP7BuctKIA3ENAlW5CHaIJxQwp+ypDq5NACNjo1YoRxUhGBn7LFYQ5q6msP1kWowY7
 TXEMPtpZedbikuiGygEIpgZIzeniY9/5xu6fuTJicn/fLSLf1qxcH9EgxwbziuRZlLpgor0Ha8
 Bras3IWbX5kPyblR0yWTE0bTblkVSPh31zX9QMW1VNUKAEAAA==
To: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, 
 josh@joshtriplett.org, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, Guo Ren <guoren@kernel.org>, 
 Alexey Gladkov <legion@kernel.org>
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=8873;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=bFEwXJHSyEjknj78wsv5L0XySyNp2PtCwbExaC/FgYY=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGqoLQ35+jUnZ6z+8gZX5PwAZtUXTOEx37QraM
 ujNn6iLkMiJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqqCwAKCRC6l81St5ZB
 T1FvDACVNjHEgYn4OZuLp1c8J/TThjhwopS8QssuaG02RFPIRIQT1jSbBB8fS19UE1HSN9ftd3t
 zyK50zaT64OnZ3z7KGOlYzf862rTrTKBhgsigkqo2MwRNtsKo8FmcFt1l3VUBmyCAvzkaXFutO0
 7YK9z3VHvhG+s1psn3fhfi/m+Ud2igKh098gorN0aEMS2gERkrjE9f7cfAEZGnon0AHzTr/eENQ
 zsLuIXcKnpn9m6hASKLM8HUpY1weDlkNtdtHKAx/psotohXYZ7klmCSeNvex7TTFclD5l04WAX0
 4BvXD3SHUq/qAN/7L9G8Us0U0F6Xnyb/lFvyMzKVy5I5PpfaWAqM0aY7GQeIfaGE7BMvWDNdzYl
 SiGCnlTKscvsvRzHmbjflQ+QvzB5q3uPBdNt/gxSAPUymg9jSR4yoD4VZnPar8DJNYQlP9BaZAV
 xxsHG9UOpISyAkBS3R8rS/7Kwoy9JBGLh7VPGH2U9VpQD+2ehouHfr7iX02bMFf7j3LRM=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received:  by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
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
Reply-To: j.granados@samsung.com
Cc: Joel Granados <j.granados@samsung.com>, linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Joel Granados <j.granados@samsung.com>

What?
These commits remove the sentinel element (last empty element) from the
sysctl arrays of all the files under the "arch/" directory that use a
sysctl array for registration. The merging of the preparation patches
(in https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
to mainline allows us to just remove sentinel elements without changing
behavior. This is now safe because the sysctl registration code
(register_sysctl() and friends) use the array size in addition to
checking for a sentinel ([1] for more info).

These commits are part of a bigger set (bigger patchset here
https://github.com/Joelgranados/linux/tree/tag/sysctl_remove_empty_elem_V4)
that remove the ctl_table sentinel. The idea is to make the review
process easier by chunking the 52 commits into manageable pieces. By
sending out one chunk at a time, they can be reviewed separately without
noise from parallel sets. After the "arch/" commits in this set are
reviewed, I will continue with drivers/*, fs/*, kernel/*, net/* and
miscellaneous. The final set will remove the unneeded check for
->procname == NULL.

Why?
By removing the sysctl sentinel elements we avoid kernel bloat as
ctl_table arrays get moved out of kernel/sysctl.c into their own
respective subsystems. This move was started long ago to avoid merge
conflicts; the sentinel removal bit came after Mathew Wilcox suggested
it to avoid bloating the kernel by one element as arrays moved out. This
patchset will reduce the overall build time size of the kernel and run
time memory bloat by about ~64 bytes per declared ctl_table array. I
have consolidated some links that shed light on the history of this
effort [2].

V2:
* Added clarification both in the commit messages and the coverletter as
  to why this patch is safe to apply.
* Added {Acked,Reviewed,Tested}-by from list
* Link to v1: https://lore.kernel.org/r/20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com

V3:
* Removed the ia64 patch to avoid conflicts with the ia64 removal
* Rebased onto v6.6-rc4
* Kept/added the trailing comma for the ctl_table arrays. This was a comment
  that we received "drivers/*" patch set.
* Link to v2: https://lore.kernel.org/r/20230913-jag-sysctl_remove_empty_elem_arch-v2-0-d1bd13a29bae@samsung.com

Testing:
* Ran sysctl selftests (./tools/testing/selftests/sysctl/sysctl.sh)
* Ran this through 0-day with no errors or warnings

Size saving after removing all sentinels:
  A consequence of eventually removing all the sentinels (64 bytes per
  sentinel) is the bytes we save. These are *not* numbers that we will
  get after this patch set; these are the numbers that we will get after
  removing all the sentinels. I included them here because they are
  relevant and to get an idea of just how much memory we are talking
  about.
    * bloat-o-meter:
        - The "yesall" configuration results save 9158 bytes (bloat-o-meter output here
          https://lore.kernel.org/all/20230621091000.424843-1-j.granados@samsung.com/)
        - The "tiny" config + CONFIG_SYSCTL save 1215 bytes (bloat-o-meter output here
          https://lore.kernel.org/all/20230809105006.1198165-1-j.granados@samsung.com/)
    * memory usage:
        we save some bytes in main memory as well. In my testing kernel
        I measured a difference of 7296 bytes. I include the way to
        measure in [3]

Size saving after this patchset:
  Here I give the values that I measured for the architecture that I'm
  running (x86_64). This can give an approximation of how many bytes are
  saved for each arch. I won't publish for all the archs because I don't
  have access to all of them.
    * bloat-o-meter
        - The "yesall" config saves 192 bytes (bloat-o-meter output [4])
        - The "tiny" config saves 64 bytes (bloat-o-meter output [5])
    * memory usage:
        In this case there were no bytes saved. To measure it comment the
        printk in `new_dir` and uncomment the if conditional in `new_links`
        [3].

Comments/feedback greatly appreciated

Best
Joel

[1]
https://lore.kernel.org/all/20230809105006.1198165-1-j.granados@samsung.com/

[2]
Links Related to the ctl_table sentinel removal:
* Good summary from Luis sent with the "pull request" for the
  preparation patches.
  https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/
* Another very good summary from Luis.
  https://lore.kernel.org/all/ZMFizKFkVxUFtSqa@bombadil.infradead.org/
* This is a patch set that replaces register_sysctl_table with register_sysctl
  https://lore.kernel.org/all/20230302204612.782387-1-mcgrof@kernel.org/
* Patch set to deprecate register_sysctl_paths()
  https://lore.kernel.org/all/20230302202826.776286-1-mcgrof@kernel.org/
* Here there is an explicit expectation for the removal of the sentinel element.
  https://lore.kernel.org/all/20230321130908.6972-1-frank.li@vivo.com
* The "ARRAY_SIZE" approach was mentioned (proposed?) in this thread
  https://lore.kernel.org/all/20220220060626.15885-1-tangmeng@uniontech.com

[3]
To measure the in memory savings apply this on top of this patchset.

"
diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index c88854df0b62..e0073a627bac 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -976,6 +976,8 @@ static struct ctl_dir *new_dir(struct ctl_table_set *set,
        table[0].procname = new_name;
        table[0].mode = S_IFDIR|S_IRUGO|S_IXUGO;
        init_header(&new->header, set->dir.header.root, set, node, table, 1);
+       // Counts additional sentinel used for each new dir.
+       printk("%ld sysctl saved mem kzalloc \n", sizeof(struct ctl_table));

        return new;
 }
@@ -1199,6 +1201,9 @@ static struct ctl_table_header *new_links(struct ctl_dir *dir, struct ctl_table_
                link_name += len;
                link++;
        }
+       // Counts additional sentinel used for each new registration
+       //if ((head->ctl_table + head->ctl_table_size)->procname)
+               printk("%ld sysctl saved mem kzalloc \n", sizeof(struct ctl_table));
        init_header(links, dir->header.root, dir->header.set, node, link_table,
                    head->ctl_table_size);
        links->nreg = nr_entries;
"
and then run the following bash script in the kernel:

accum=0
for n in $(dmesg | grep kzalloc | awk '{print $3}') ; do
    echo $n
    accum=$(calc "$accum + $n")
done
echo $accum

[4]
add/remove: 0/0 grow/shrink: 0/3 up/down: 0/-192 (-192)
Function                                     old     new   delta
sld_sysctls                                  128      64     -64
itmt_kern_table                              128      64     -64
abi_table2                                   128      64     -64
Total: Before=429173594, After=429173402, chg -0.00%

[5]
add/remove: 0/0 grow/shrink: 1/0 up/down: 64/0 (64)
Function                                     old     new   delta
sld_sysctls                                   64     128     +64
Total: Before=1886119, After=1886183, chg +0.00%

Signed-off-by: Joel Granados <j.granados@samsung.com>

---

---
Joel Granados (7):
      S390: Remove now superfluous sentinel elem from ctl_table arrays
      arm: Remove now superfluous sentinel elem from ctl_table arrays
      arch/x86: Remove now superfluous sentinel elem from ctl_table arrays
      x86/vdso: Remove now superfluous sentinel element from ctl_table array
      riscv: Remove now superfluous sentinel element from ctl_table array
      powerpc: Remove now superfluous sentinel element from ctl_table arrays
      c-sky: Remove now superfluous sentinel element from ctl_talbe array

 arch/arm/kernel/isa.c                     | 4 ++--
 arch/arm64/kernel/armv8_deprecated.c      | 8 +++-----
 arch/arm64/kernel/fpsimd.c                | 2 --
 arch/arm64/kernel/process.c               | 1 -
 arch/csky/abiv1/alignment.c               | 1 -
 arch/powerpc/kernel/idle.c                | 1 -
 arch/powerpc/platforms/pseries/mobility.c | 1 -
 arch/riscv/kernel/vector.c                | 1 -
 arch/s390/appldata/appldata_base.c        | 4 +---
 arch/s390/kernel/debug.c                  | 1 -
 arch/s390/kernel/topology.c               | 1 -
 arch/s390/mm/cmm.c                        | 1 -
 arch/s390/mm/pgalloc.c                    | 1 -
 arch/x86/entry/vdso/vdso32-setup.c        | 1 -
 arch/x86/kernel/cpu/intel.c               | 1 -
 arch/x86/kernel/itmt.c                    | 1 -
 drivers/perf/arm_pmuv3.c                  | 1 -
 17 files changed, 6 insertions(+), 25 deletions(-)
---
base-commit: 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
change-id: 20230904-jag-sysctl_remove_empty_elem_arch-81db0a6e6cc4

Best regards,
-- 
Joel Granados <j.granados@samsung.com>

