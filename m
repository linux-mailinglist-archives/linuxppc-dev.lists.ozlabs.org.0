Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EED5A8939
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 00:49:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHzrQ13dSz3cfh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 08:49:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sfPp5Tsa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sfPp5Tsa;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHzqc2xb5z3c7M
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 08:48:44 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B3AA1B8235E
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 22:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702BAC433D6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 22:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661986118;
	bh=SdHa5pDQL1v4y8r0iVgw8YkeCp6wtD7C5ZH57dr8xxA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sfPp5Tsai1Q8RtxgKbYrwDe/3c9tCORAHbyioKy9hNNlEYlFHDRaEheqI/jhnNZsr
	 mmSgsv5cAaySAPpdx1NVE3OCgmsScWrxB+la+WtyLC5OhFHNPpfRVRsLCi5vubFwf+
	 aKq9Qw1sPVJTf1RtGZ7P2c9VSnEvDk/GMwCHHW9FUU6nMN4Aa7aRLUnVgrGeGP5Us8
	 qlk3XbtA7KI3M09iMLiII1WiP8KysEDd0wqdl8EwsfCg6pCYJjKMM9pvHQlGOhy5H6
	 04mpvUMseJC2S6fL6+NsC6lScSVE9cLXQVXuRopwcy1RzVfmkMAmW3gFD8z77nRDaG
	 A5I5TqppHsRkw==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-333a4a5d495so320250807b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 15:48:38 -0700 (PDT)
X-Gm-Message-State: ACgBeo16PnEyvipjZGdEWSBZLb9XozytVkNVuXJVVTKKm4w94lOZ8Hsc
	xumv0Zt/xHpGqMk1I2pFSvjEhL7cHpXnhWu82R8=
X-Google-Smtp-Source: AA6agR5/pePrfqlxoHbd6V/eHuFg7JBdfexzl0+0lmWUul3AjQo+TxnLpUdRIYFSA1fKtpsZnRBykwLndNs9C7E5Sls=
X-Received: by 2002:a81:1192:0:b0:33e:9091:ae81 with SMTP id
 140-20020a811192000000b0033e9091ae81mr20408676ywr.211.1661986117499; Wed, 31
 Aug 2022 15:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220830185313.76402-1-song@kernel.org> <Yw+4xxiONngOTqin@redhat.com>
 <875yi8uju3.fsf@mpe.ellerman.id.au>
In-Reply-To: <875yi8uju3.fsf@mpe.ellerman.id.au>
From: Song Liu <song@kernel.org>
Date: Wed, 31 Aug 2022 15:48:26 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7aZwXyuZAv23xDXsxCJc0mJNms+HegqkZqukVqT0cfZA@mail.gmail.com>
Message-ID: <CAPhsuW7aZwXyuZAv23xDXsxCJc0mJNms+HegqkZqukVqT0cfZA@mail.gmail.com>
Subject: Re: [PATCH v5] livepatch: Clear relocation targets on a module removal
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, Jiri Kosina <jikos@kernel.org>, open list <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, X86 ML <x86@kernel.org>, Miroslav Benes <mbenes@suse.cz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 31, 2022 at 3:30 PM Michael Ellerman <mpe@ellerman.id.au> wrote=
:
>
> Joe Lawrence <joe.lawrence@redhat.com> writes:
> > On Tue, Aug 30, 2022 at 11:53:13AM -0700, Song Liu wrote:
> >> From: Miroslav Benes <mbenes@suse.cz>
> >>
> >> Josh reported a bug:
> >>
> >>   When the object to be patched is a module, and that module is
> >>   rmmod'ed and reloaded, it fails to load with:
> >>
> >>   module: x86/modules: Skipping invalid relocation target, existing va=
lue is nonzero for type 2, loc 00000000ba0302e9, val ffffffffa03e293c
> >>   livepatch: failed to initialize patch 'livepatch_nfsd' for module 'n=
fsd' (-8)
> >>   livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusing=
 to load module 'nfsd'
> >>
> >>   The livepatch module has a relocation which references a symbol
> >>   in the _previous_ loading of nfsd. When apply_relocate_add()
> >>   tries to replace the old relocation with a new one, it sees that
> >>   the previous one is nonzero and it errors out.
> >>
> >>   On ppc64le, we have a similar issue:
> >>
> >>   module_64: livepatch_nfsd: Expected nop after call, got e8410018 at =
e_show+0x60/0x548 [livepatch_nfsd]
> >>   livepatch: failed to initialize patch 'livepatch_nfsd' for module 'n=
fsd' (-8)
> >>   livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusing=
 to load module 'nfsd'
> ...
> >>
> >
> > Hi Song,
> >
> > Applying your patch on top of my latest klp-convert-tree branch [1], I
> > modified a few of its late module patching tests
> > (tools/testing/selftests/livepatch/test-song.sh) such that:
> >
> >  1 - A livepatch module is loaded
> >    - this module contains klp-relocations to objects in (2)
> >  2 - A target test module is loaded
> >  3 - Unload the test target module
> >    - Clear klp-relocations in (1)
> >  4 - Repeat target module load (2) / unload (3) a few times
> >  5 - Unload livepatch module
>
> If you push that test code somewhere I could test it on ppc64le.
>
> > The results:
> >
> >  x86_64  : pass
> >  s390x   : pass
> >  ppc64le : crash
> >
> > I suspect Power 32-bit would suffer the same fate, but I don't have
> > hardware to verify.  See the kernel log from the crash below...
> >
> >
> > =3D=3D=3D=3D=3D TEST: klp-convert symbols (late module patching) =3D=3D=
=3D=3D=3D
> > % modprobe test_klp_convert1
> > test_klp_convert1: tainting kernel with TAINT_LIVEPATCH
> > livepatch: enabling patch 'test_klp_convert1'
> > livepatch: 'test_klp_convert1': starting patching transition
> > livepatch: 'test_klp_convert1': patching complete
> > % modprobe test_klp_convert_mod
> > livepatch: applying patch 'test_klp_convert1' to loading module 'test_k=
lp_convert_mod'
> > test_klp_convert1: saved_command_line, 0: BOOT_IMAGE=3D(ieee1275//vdevi=
ce/v-scsi@30000003/disk@8100000000000000,msdos2)/vmlinuz-5.19.0+ root=3D/de=
v/mapper/rhel_ibm--p9z--18--lp7-root ro crashkernel=3D2G-4G:384M,4G-16G:512=
M,16G-64G:1G,64G-128G:2G,128G-:4G rd.lvm.lv=3Drhel_ibm-p9z-18-lp7/root rd.l=
vm.lv=3Drhel_ibm-p9z-18-lp7/swap
> > test_klp_convert1: driver_name, 0: test_klp_convert_mod
> > test_klp_convert1: test_klp_get_driver_name(), 0: test_klp_convert_mod
> > test_klp_convert1: homonym_string, 1: homonym string A
> > test_klp_convert1: get_homonym_string(), 1: homonym string A
> > test_klp_convert1: klp_string.12345 =3D lib/livepatch/test_klp_convert_=
mod_a.c static string
> > test_klp_convert1: klp_string.67890 =3D lib/livepatch/test_klp_convert_=
mod_b.c static string
> > % rmmod test_klp_convert_mod
> > livepatch: reverting patch 'test_klp_convert1' on unloading module 'tes=
t_klp_convert_mod'
> > module_64: Clearing ADD relocate section 48 to 6
> > BUG: Unable to handle kernel data access on write at 0xc008000002140150
> > Faulting instruction address: 0xc00000000005659c
> > Oops: Kernel access of bad area, sig: 11 [#1]
> > LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSeries
> > Modules linked in: test_klp_convert_mod(-) test_klp_convert1(K) bonding=
 tls rfkill pseries_rng drm fuse drm_panel_orientation_quirks xfs libcrc32c=
 sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp vmx_crypto dm_mirror =
dm_region_hash dm_log dm_mod
> > CPU: 6 PID: 4766 Comm: rmmod Kdump: loaded Tainted: G              K   =
5.19.0+ #1
> > NIP:  c00000000005659c LR: c000000000056590 CTR: 0000000000000024
> > REGS: c000000007223840 TRAP: 0300   Tainted: G              K    (5.19.=
0+)
> > MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48008282  XER: 00000=
00a
> > CFAR: c0000000000a87e0 DAR: c008000002140150 DSISR: 0a000000 IRQMASK: 0
>
> This is saying you don't have permissions to write at that address.
>
> > GPR00: c000000000056568 c000000007223ae0 c000000002a68a00 0000000000000=
001
> > GPR04: c0080000021706f0 000000000000002d 0000000000000000 0000000000000=
000
> > GPR08: 0000000000000066 0000001200000010 0000000000000000 0000000000008=
000
> > GPR12: 0000000000000000 c00000000ffca080 0000000000000000 0000000000000=
000
> > GPR16: 0000010005bf1810 000000010c0f7370 c0000000011b7e50 c0000000011b7=
e68
> > GPR20: c0080000021501c8 c008000002150228 0000000000000030 0000000060000=
000
> > GPR24: c008000002160380 c000000056b43000 000000000000ff20 c000000056b43=
c00
> > GPR28: aaaaaaaaaaaaaaab c000000056b43b40 0000000000000000 c008000002140=
14c
> > NIP [c00000000005659c] clear_relocate_add+0x11c/0x1c0
> > LR [c000000000056590] clear_relocate_add+0x110/0x1c0
> > Call Trace:
> > [c000000007223ae0] [ffffffffffffffff] 0xffffffffffffffff (unreliable)
> > [c000000007223ba0] [c00000000021e3a8] klp_cleanup_module_patches_limite=
d+0x448/0x480
> > [c000000007223cb0] [c000000000220278] klp_module_going+0x68/0x94
> > [c000000007223ce0] [c00000000022f480] __do_sys_delete_module.constprop.=
0+0x1d0/0x390
> > [c000000007223db0] [c00000000002f004] system_call_exception+0x164/0x340
> > [c000000007223e10] [c00000000000be68] system_call_vectored_common+0xe8/=
0x278
> > --- interrupt: 3000 at 0x7fffa178fb6c
> > NIP:  00007fffa178fb6c LR: 0000000000000000 CTR: 0000000000000000
> > REGS: c000000007223e80 TRAP: 3000   Tainted: G              K    (5.19.=
0+)
> > MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 480024=
82  XER: 00000000
> > IRQMASK: 0
> > GPR00: 0000000000000081 00007ffff2d1b720 00007fffa1887200 0000010005bf1=
878
> > GPR04: 0000000000000800 000000000000000a 0000000000000000 0000000000000=
0da
> > GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> > GPR12: 0000000000000000 00007fffa201c540 0000000000000000 0000000000000=
000
> > GPR16: 0000010005bf1810 000000010c0f7370 000000010c0f8090 000000010c0f8=
078
> > GPR20: 000000010c0f8050 000000010c0f80a8 000000010c0f7518 000000010c0f8=
0d0
> > GPR24: 00007ffff2d1b830 00007ffff2d1efbb 0000000000000000 0000010005bf0=
2a0
> > GPR28: 00007ffff2d1be50 0000000000000000 0000010005bf1810 0000000000100=
000
> > NIP [00007fffa178fb6c] 0x7fffa178fb6c
> > LR [0000000000000000] 0x0
> > --- interrupt: 3000
> > Instruction dump:
> > 40820044 813b002c 7ff5f82a 79293664 7d394a14 e9290010 7c69f82e 7fe9fa14
> > 48052235 60000000 2c030000 41820008 <92ff0004> eadb0020 60000000 600000=
00
> > ---[ end trace 0000000000000000 ]---
> >
> > $ addr2line 0xc00000000005659c -e vmlinux
> > /root/klp-convert-tree/arch/powerpc/kernel/module_64.c:785
> >
> > 743 void clear_relocate_add(Elf64_Shdr *sechdrs,
> > 744                        const char *strtab,
> > 745                        unsigned int symindex,
> > 746                        unsigned int relsec,
> > 747                        struct module *me)
> > 748 {
> > ...
> > 759         for (i =3D 0; i < sechdrs[relsec].sh_size / sizeof(*rela); =
i++) {
> > ...
> > 785                 *instruction =3D PPC_RAW_NOP();
> > 786         }
>
> Has the module text been marked RW prior to this? I suspect not?
>
> In which case you need to use patch_instruction() here.
>
> cheers

Thanks folks!

I guess something like this would fix compile for ppc32 and fix crash for p=
pc64.

I also pushed it to

https://git.kernel.org/pub/scm/linux/kernel/git/song/linux.git/log/?h=3Dklp=
-module-reload

This includes Joe's klp-convert patches and this patch.

Thanks!
Song



diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_3=
2.c
index ea6536171778..e3c312770453 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -285,6 +285,16 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
        return 0;
 }

+#ifdef CONFIG_LIVEPATCH
+void clear_relocate_add(Elf32_Shdr *sechdrs,
+                  const char *strtab,
+                  unsigned int symindex,
+                  unsigned int relsec,
+                  struct module *me)
+{
+}
+#endif
+
 #ifdef CONFIG_DYNAMIC_FTRACE
 notrace int module_trampoline_target(struct module *mod, unsigned long add=
r,
                                     unsigned long *target)
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_6=
4.c
index 6aaf5720070d..4d55f0e52704 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -782,7 +782,7 @@ void clear_relocate_add(Elf64_Shdr *sechdrs,
                        continue;

                instruction +=3D 1;
-               *instruction =3D PPC_RAW_NOP();
+               patch_instruction(instruction, PPC_RAW_NOP());
        }

 }
diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index d22b36b84b4b..958e6da7f475 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -73,7 +73,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
                       unsigned int relsec,
                       struct module *mod);
 #ifdef CONFIG_LIVEPATCH
-void clear_relocate_add(Elf64_Shdr *sechdrs,
+void clear_relocate_add(Elf_Shdr *sechdrs,
                   const char *strtab,
                   unsigned int symindex,
                   unsigned int relsec,
