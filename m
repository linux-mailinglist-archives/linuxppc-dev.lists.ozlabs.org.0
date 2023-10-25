Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 051F27D77B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 00:19:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=amQFbEgf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SG3Hd0HG1z3cPf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 09:19:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=amQFbEgf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yahoo.com (client-ip=66.163.190.31; helo=sonic307-56.consmr.mail.ne1.yahoo.com; envelope-from=eric_devolder@yahoo.com; receiver=lists.ozlabs.org)
Received: from sonic307-56.consmr.mail.ne1.yahoo.com (sonic307-56.consmr.mail.ne1.yahoo.com [66.163.190.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFptP4wpSz30dt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Oct 2023 23:59:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1698238791; bh=sugOKRFZaXP+KvWmZDsIwr89UlDVgatgp+vbZ1EwrCU=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=amQFbEgfjvjyW2dZ28EpYtWfmFZqU+i90S43zYtLo7XNW+RNe6A4gMMRUCt5wT62w9asx2RRIMFzw6ikNJyI34ECqAG6dEMSoUovX3U+JfJCbQ8D62C0mhaYwKISbzIqwl0Mofr28fZGZcPkrAOc0HxhR9qHLi69a6freKZXlk4kygoYlBbqAGw2ggHInsCBy8IuIsynyAzess1rTsvxQIwa4li+M30GnQPDtdW2tZyrd4muKcCWde0BV1X9aSw6v1wyYprPoK8oL/9PEKSURGyIfplcvtGiAnVjJkwN5JPedXESiUUF30NopSZn1kJMwl3nF6iObugwbiUF6CAJ2A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1698238791; bh=/RE4ryRqUhim9AkP1Lk8Xz7ZsGpNQ0+dbkgihyV6bjr=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=p8OGg8/0JV/GF1tqySv12gIhkNxqT9r2fAOzAoWxnMuCUfqLC2tDwud5Mht4KduJowGGxOOqoGsFCPuct8OK4To4oYQyTjO8nAfIACfJg1OPS2bPMvlbBwCgnAEbb70ZpkcfBCfHmwKb2KGrRKIZL/wfNOr03ayQUgmsyBKAZ5EVzlLUcy3FOgI0EeOXhbbZPxd4QXSwOZAK8tM/IOjvKepZXEZAdbQzOzI9L6YLfXhTezMlxUpNB69RmyCezA0Lg6aN3F7lvvk6KuZQsZPQoouoa2rrfV/o0VDMuytuvW/kYadL9W+iHG9EVOEBpmIYB/NPKEC686r0NcosHr+xYQ==
X-YMail-OSG: c0u6bvwVM1k6slF8tJ4MoD6HcFpQ9XIUAtQDL.Y953OGBxEH9gH.Lo1kAyJBMQ2
 HL_Q72M7e5tMp3dyZGzdwSMqbggzqWrXUPOeJ6s3lT6pAR2YFsMvHoFkqn94Aae22faqEEpVk_V2
 ExSLcSC8lT61RQc.UhJx.gnTCZETQ_U4YJiqetuGEWQ0JK1OY5F.jBUMRGGZGx0zvlK2qLNDiFyi
 U848xpnfKT57H5f8DWB0LGfYR89r9aYka8Yg8JGO2q7uDwQPKQ1mGMQyh2._BT6ZgWCB2tPOv2pA
 VhmDpFU2kVAPE0PzKM4IbTq0hhFSFcaqiGrFciELmHkNDPqt8D.5pxT8SW0etYjy82llw8rrfj.I
 McoaWHFKhawTYFkqMXSNaPSK4XcKtPzal.W1cOcdzoMjox.S6IpayEHNWNhOxBVdQHSM49cnTXS6
 HYWsm3Tv3aaPiL.WjTRpZBOqnG4UQKrK66KcBU.FsEB6Th.2BWkUwBkRDuITq3.8K898B2CAPeql
 EEzKYv9ZrIF7QuyfgYWQJLc6pg96S_2PYWQ9e._vB3pwMcR_IC1UoECSsnnvFORAWl4u7mzF9e10
 BDtx1uFKg.KtNSehrE9UOMcIyIsoUD6guUwYQTDXGk.AcwfVB59jEh6_jmqxzwOkS7TfvOXslsKp
 TqMkc3r05Q9DEYPA8EeqtUt8jhKFtV0WHU5lG1mV8byP2UoPf.PXrvQse8GPEWMvcxp0OucZJ29c
 9.kFB_gN7ZXdNqU2jqCiqkWQQOmykowB_K0w79Soh3Ig1JIjLPQ1rlzW1MouukLza7JqCjx0gMaT
 UPNBwTBHP1t_8vRij535N4Wic_2cok56v0jpg7Z8buH9XH9EUGdZL14jozVXRBvjBhmt0mEW7Fvp
 N64b.rxZLdR7GbCvk2BLK9B_4Qq4PH5mkh9EkhXvo1P.oFYtb9siB.g5yjK6pFYUMnwesi8cxKIf
 MKKwxar74c15dAIE1_zAdxnTflgalCykEMu2QyozYC31CLqb9R7XYHB76yq.U3Soyw10AqijMs1o
 xGJ_rFsVVwIMMIYh_ebMCOtW4LDfCthyb8TPh8EuAj.Y_rd8k_FLjlzOPoX1gtERfPethFPIKf4G
 Lcbed_qUBE4xXVhFsbh2V4eJ_yqR5CorLSexyh4dN9yFnJhmeBNFKtj0R_SqaUiIczaB.sp6e9ir
 Xx_U9FD5NPT0xNMU66wPL7U99cas.ukI6zIpl8giThSYVl0DnTBF0565UscxUjCSHaOya6tkPhL5
 EqCrAcqafihQv.wW20t6bQGOOpC.UjiGmU9QhJJk0VSGgw17fj1PhqTRr6c2MPwDj2sgCSK0R8zE
 L3mKZ7wTZlKkRCfsAAA0CCt1439uiAeCtj49uRqi91iEW6scoxsrMyBacu6ultoBJU6ogSwEOqXB
 HF_8Xc3g0WKdisARS.WoihJtza57SKHiCk3rb3zrO58N9buAr_mgFhqt4kL_0jaca24yKmHEp8QW
 OOnd52zNY72geCwisANt8xLkDsXzkkRUJgX3HYmZku3kG5attebSf0n3MN5eenuTXM5.HEyh0q_1
 4TSWCZTBb2smM6ogTUJl.YdOPJEAtwKlsJrbYFYoh8YNhCDHC2gOxOeaYKzAUoZi7OUmmJGzpKm5
 EG6YdWUtoHQID1onfOIFr55h9UtBHA03u3zpKX7uZXNl6t4uuT9Mz38mWiHZpxH5XgFIgiQL9SJp
 KDUrW0mRnHbxkjdGp2BOWl1HzH7XWYFwf9CrKByLCkDGeQ1QQ83QLPkT5E.kWJyP3kDsSvfm.nER
 _Tsj4eelsRSyt8TerRsCf.SxsRABfQbVB4TMWMZgEQ4wjFgGEe_nNoELuXe0ws4lYqYS09PkACk1
 sDwGMzBkmDDMobC58CUasJj5mM49NGxc7tq2Ykm4kjoAUbxqKBXSV8Bob6kRuUpdEttVrAZJfUoX
 TTrTGJCBESyETOHh3K8cc6ywhjou4IUVf5VU9WqPrxpUotXDJ69F_iX_kUNMdFsr1hu3PNe2LJ25
 KAtOaBSIpSCaXNSvRm50GFRuvnMh27iHq4HhTp.8WUHkyxuHUQFK3Yf3VlauEsI4cVszJUuse4nv
 k5voaAPj3E.KBAYKlOyO1rNKBweM45qLKKI5NeQJ_a4Uyo7xKJ3g9G39mF55Uc98spfcYl.08INi
 MMPX8GN46tBKk6h.wNMR78NmtToTytNW36p4MjroZFvYZVsZJ..kRQdDlUZAKyeKKBlR2mb1XA_c
 aBhlgL62sf21gdfyr1q8L7Sy3vzfNckEf
X-Sonic-MF: <eric_devolder@yahoo.com>
X-Sonic-ID: 3b70e9fe-a5d1-4ae7-87f0-cee23a5137fa
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Oct 2023 12:59:51 +0000
Date: Wed, 25 Oct 2023 12:59:44 +0000 (UTC)
From: Eric DeVolder <eric_devolder@yahoo.com>
To: Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>
Message-ID: <792870842.2327439.1698238784090@mail.yahoo.com>
In-Reply-To: <ZTjmsku919U6u6wt@MiWiFi-R3L-srv>
References: <20231023110308.1202042-1-arnd@kernel.org> <ZTe8NOgAjvKDA6z0@MiWiFi-R3L-srv> <b71034f4-5cdc-44e0-b72f-1a8ffae0593e@app.fastmail.com> <ZTjmsku919U6u6wt@MiWiFi-R3L-srv>
Subject: Re: [PATCH 1/2] kexec: fix KEXEC_FILE dependencies
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_2327438_1021333898.1698238784088"
X-Mailer: WebService/1.1.21797 YMailNorrin
X-Mailman-Approved-At: Thu, 26 Oct 2023 09:18:27 +1100
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

------=_Part_2327438_1021333898.1698238784088
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=20

    On Wednesday, October 25, 2023 at 04:58:20 AM CDT, Baoquan He <bhe@redh=
at.com> wrote: =20
=20
 On 10/24/23 at 03:17pm, Arnd Bergmann wrote:
> On Tue, Oct 24, 2023, at 14:44, Baoquan He wrote:
> > Just add people and mailing list to CC since I didn't find this mail in
> > my box, just drag it via 'b4 am'.
> >
> > On 10/23/23 at 01:01pm, Arnd Bergmann wrote:
> > ......
>=20
> >> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> >> index 7aff28ded2f48..bfc636d64ff2b 100644
> >> --- a/kernel/Kconfig.kexec
> >> +++ b/kernel/Kconfig.kexec
> >> @@ -36,6 +36,7 @@ config KEXEC
> >>=C2=A0 config KEXEC_FILE
> >>=C2=A0 =C2=A0=C2=A0=C2=A0 bool "Enable kexec file based system call"
> >>=C2=A0 =C2=A0=C2=A0=C2=A0 depends on ARCH_SUPPORTS_KEXEC_FILE
> >> +=C2=A0=C2=A0=C2=A0 depends on CRYPTO_SHA256=3Dy || !ARCH_SUPPORTS_KEX=
EC_PURGATORY
> >
> > I am not sure if the logic is correct. In theory, kexec_file code
> > utilizes purgatory to verify the checksum digested during kernel loadin=
g
> > when try to jump to the kernel. That means kexec_file depends on
> > purgatory, but not contrary?
>=20
> The expression I wrote is a bit confusing, but I think this just
> keeps the existing behavior:
>=20
> - on architectures that select ARCH_SUPPORTS_KEXEC_PURGATORY
>=C2=A0 (powerpc, riscv, s390 and x86), we also require CRYPTO_SHA256
>=C2=A0 to be built-in.
> - on architectures that do not have ARCH_SUPPORTS_KEXEC_PURGATORY
>=C2=A0 (arm64 and parisc), CRYPTO_SHA256 is not used and can be disabled
>=C2=A0 or =3Dm.
>=20
> Since ARCH_SUPPORTS_KEXEC_PURGATORY is a 'bool' symbol, it could
> be written as
>=20
> depends on (ARCH_SUPPORTS_KEXEC_PURGATORY && CRYPTO_SHA256=3Dy) \
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || !ARCH_SUPPORTS_KEXEC_PURGATOR=
Y

Yes, this seems to be clearer to me. Thanks.

>=20
> if you find that clearer. I see that the second patch
> actually gets this wrong, it should actually do
>=20
> select CRYPTO if ARCH_SUPPORTS_KEXEC_PURGATORY
> select CRYPTO_SHA256 if ARCH_SUPPORTS_KEXEC_PURGATORY

Yeah, makes sense to me.

Hi Eric,

Do you have comment about these?
[eric]: The original goal of the conversion patches was to consolidate, but=
 keep existing behavior.Then I had to break existing behavior a bit by tyin=
g CRASH to KEXEC. I was hoping to haveavoided introducing new problems, but=
 looks like there was an escape. At any rate, I thinkthe ideas here are on =
track and necessary. Unfortunately at the moment I'm not at a placewhere I =
can test.

>=20
> > With these changes, we can achieve the goal to avoid building issue,
> > whereas the code logic becomes confusing. E.g people could disable
> > CONFIG_KEXEC_FILE, but still get purgatory code built in which is
> > totally useless.
> >
> > Not sure if I think too much over this.
>=20
> I see your point here, and I would suggest changing the
> CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY symbol to just indicate
> the availability of the purgatory code for the arch, rather
> than actually controlling the code itself. I already mentioned
> this for s390, but riscv would need the same thing on top.
>=20
> I think the change below should address your concern.
>=20
>=C2=A0 =C2=A0 =C2=A0 Arnd
>=20
> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.=
c
> index e60fbd8660c4..3ac341d296db 100644
> --- a/arch/riscv/kernel/elf_kexec.c
> +++ b/arch/riscv/kernel/elf_kexec.c
> @@ -266,7 +266,7 @@ static void *elf_kexec_load(struct kimage *image, cha=
r *kernel_buf,
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmdline =3D modifi=
ed_cmdline;
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>=C2=A0=20
> -#ifdef CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY
> +#ifdef CONFIG_KEXEC_FILE
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Add purgatory to the image */
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 kbuf.top_down =3D true;
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 kbuf.mem =3D KEXEC_BUF_MEM_UNKNOWN;
> @@ -280,7 +280,7 @@ static void *elf_kexec_load(struct kimage *image, cha=
r *kernel_buf,
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sizeof(kernel_start), 0);
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("Error upda=
te purgatory ret=3D%d\n", ret);
> -#endif /* CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY */
> +#endif /* CONFIG_KEXEC_FILE */

If so, we don't need the CONFIG_KEXEC_FILE ifdeffery because the
file elf_kexec.c relied on CONFIG_KEXEC_FILE enabling to build in.
We can just remove the "#ifdef CONFIG_KEXEC_FILE..#endif" as x86 does.

>=C2=A0=20
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Add the initrd to the image */
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (initrd !=3D NULL) {
> diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
> index d25ad1c19f88..ab181d187c23 100644
> --- a/arch/riscv/Kbuild
> +++ b/arch/riscv/Kbuild
> @@ -5,7 +5,7 @@ obj-$(CONFIG_BUILTIN_DTB) +=3D boot/dts/
>=C2=A0 obj-y +=3D errata/
>=C2=A0 obj-$(CONFIG_KVM) +=3D kvm/
>=C2=A0=20
> -obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) +=3D purgatory/
> +obj-$(CONFIG_KEXEC_FILE) +=3D purgatory/
>=C2=A0=20
>=C2=A0 # for cleaning
>=C2=A0 subdir- +=3D boot
> diff --git a/arch/s390/Kbuild b/arch/s390/Kbuild
> index a5d3503b353c..361aa01dbd49 100644
> --- a/arch/s390/Kbuild
> +++ b/arch/s390/Kbuild
> @@ -7,7 +7,7 @@ obj-$(CONFIG_S390_HYPFS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D =
hypfs/
>=C2=A0 obj-$(CONFIG_APPLDATA_BASE)=C2=A0 =C2=A0 +=3D appldata/
>=C2=A0 obj-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D net/
>=C2=A0 obj-$(CONFIG_PCI)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
=3D pci/
> -obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) +=3D purgatory/
> +obj-$(CONFIG_KEXEC_FILE)=C2=A0 =C2=A0 =C2=A0 +=3D purgatory/
>=C2=A0=20
>=C2=A0 # for cleaning
>=C2=A0 subdir- +=3D boot tools
>=20

 =20
------=_Part_2327438_1021333898.1698238784088
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpb2eae16ayahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px=
;"><div></div>
        <div><br></div><div><br></div>
       =20
        </div><div id=3D"ydpb8ccb2eayahoo_quoted_8406838175" class=3D"ydpb8=
ccb2eayahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Wednesday, October 25, 2023 at 04:58:20 AM CDT, Baoq=
uan He &lt;bhe@redhat.com&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div>On 10/24/23 at 03:17pm, Arnd Bergmann wrote:<br clear=
=3D"none">&gt; On Tue, Oct 24, 2023, at 14:44, Baoquan He wrote:<br clear=
=3D"none">&gt; &gt; Just add people and mailing list to CC since I didn't f=
ind this mail in<br clear=3D"none">&gt; &gt; my box, just drag it via 'b4 a=
m'.<br clear=3D"none">&gt; &gt;<br clear=3D"none">&gt; &gt; On 10/23/23 at =
01:01pm, Arnd Bergmann wrote:<br clear=3D"none">&gt; &gt; ......<br clear=
=3D"none">&gt; <br clear=3D"none">&gt; &gt;&gt; diff --git a/kernel/Kconfig=
.kexec b/kernel/Kconfig.kexec<br clear=3D"none">&gt; &gt;&gt; index 7aff28d=
ed2f48..bfc636d64ff2b 100644<br clear=3D"none">&gt; &gt;&gt; --- a/kernel/K=
config.kexec<br clear=3D"none">&gt; &gt;&gt; +++ b/kernel/Kconfig.kexec<br =
clear=3D"none">&gt; &gt;&gt; @@ -36,6 +36,7 @@ config KEXEC<br clear=3D"non=
e">&gt; &gt;&gt;&nbsp; config KEXEC_FILE<br clear=3D"none">&gt; &gt;&gt;&nb=
sp; &nbsp;&nbsp;&nbsp; bool "Enable kexec file based system call"<br clear=
=3D"none">&gt; &gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; depends on ARCH_SUPPORTS_K=
EXEC_FILE<br clear=3D"none">&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp; depends on CR=
YPTO_SHA256=3Dy || !ARCH_SUPPORTS_KEXEC_PURGATORY<br clear=3D"none">&gt; &g=
t;<br clear=3D"none">&gt; &gt; I am not sure if the logic is correct. In th=
eory, kexec_file code<br clear=3D"none">&gt; &gt; utilizes purgatory to ver=
ify the checksum digested during kernel loading<br clear=3D"none">&gt; &gt;=
 when try to jump to the kernel. That means kexec_file depends on<br clear=
=3D"none">&gt; &gt; purgatory, but not contrary?<br clear=3D"none">&gt; <br=
 clear=3D"none">&gt; The expression I wrote is a bit confusing, but I think=
 this just<br clear=3D"none">&gt; keeps the existing behavior:<br clear=3D"=
none">&gt; <br clear=3D"none">&gt; - on architectures that select ARCH_SUPP=
ORTS_KEXEC_PURGATORY<br clear=3D"none">&gt;&nbsp;  (powerpc, riscv, s390 an=
d x86), we also require CRYPTO_SHA256<br clear=3D"none">&gt;&nbsp;  to be b=
uilt-in.<br clear=3D"none">&gt; - on architectures that do not have ARCH_SU=
PPORTS_KEXEC_PURGATORY<br clear=3D"none">&gt;&nbsp;  (arm64 and parisc), CR=
YPTO_SHA256 is not used and can be disabled<br clear=3D"none">&gt;&nbsp;  o=
r =3Dm.<br clear=3D"none">&gt; <br clear=3D"none">&gt; Since ARCH_SUPPORTS_=
KEXEC_PURGATORY is a 'bool' symbol, it could<br clear=3D"none">&gt; be writ=
ten as<br clear=3D"none">&gt; <br clear=3D"none">&gt; depends on (ARCH_SUPP=
ORTS_KEXEC_PURGATORY &amp;&amp; CRYPTO_SHA256=3Dy) \<br clear=3D"none">&gt;=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; || !ARCH_SUPPORTS_KEXEC_PURGATORY=
<br clear=3D"none"><br clear=3D"none">Yes, this seems to be clearer to me. =
Thanks.<br clear=3D"none"><br clear=3D"none">&gt; <br clear=3D"none">&gt; i=
f you find that clearer. I see that the second patch<br clear=3D"none">&gt;=
 actually gets this wrong, it should actually do<br clear=3D"none">&gt; <br=
 clear=3D"none">&gt; select CRYPTO if ARCH_SUPPORTS_KEXEC_PURGATORY<br clea=
r=3D"none">&gt; select CRYPTO_SHA256 if ARCH_SUPPORTS_KEXEC_PURGATORY<br cl=
ear=3D"none"><br clear=3D"none">Yeah, makes sense to me.<br clear=3D"none">=
<br clear=3D"none">Hi Eric,<br clear=3D"none"><br clear=3D"none"><div>Do yo=
u have comment about these?</div><div><br></div><div dir=3D"ltr" data-setdi=
r=3D"false">[eric]: The original goal of the conversion patches was to cons=
olidate, but keep existing behavior.</div><div dir=3D"ltr" data-setdir=3D"f=
alse">Then I had to break existing behavior a bit by tying CRASH to KEXEC. =
I was hoping to have</div><div dir=3D"ltr" data-setdir=3D"false">avoided in=
troducing new problems, but looks like there was an escape. At any rate, I =
think</div><div dir=3D"ltr" data-setdir=3D"false">the ideas here are on tra=
ck and necessary. Unfortunately at the moment I'm not at a place</div><div =
dir=3D"ltr" data-setdir=3D"false">where I can test.<br></div><br clear=3D"n=
one">&gt; <br clear=3D"none">&gt; &gt; With these changes, we can achieve t=
he goal to avoid building issue,<br clear=3D"none">&gt; &gt; whereas the co=
de logic becomes confusing. E.g people could disable<br clear=3D"none">&gt;=
 &gt; CONFIG_KEXEC_FILE, but still get purgatory code built in which is<br =
clear=3D"none">&gt; &gt; totally useless.<br clear=3D"none">&gt; &gt;<br cl=
ear=3D"none">&gt; &gt; Not sure if I think too much over this.<br clear=3D"=
none">&gt; <br clear=3D"none">&gt; I see your point here, and I would sugge=
st changing the<br clear=3D"none">&gt; CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY=
 symbol to just indicate<br clear=3D"none">&gt; the availability of the pur=
gatory code for the arch, rather<br clear=3D"none">&gt; than actually contr=
olling the code itself. I already mentioned<br clear=3D"none">&gt; this for=
 s390, but riscv would need the same thing on top.<br clear=3D"none">&gt; <=
br clear=3D"none">&gt; I think the change below should address your concern=
.<br clear=3D"none">&gt; <br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; Arnd<b=
r clear=3D"none">&gt; <br clear=3D"none">&gt; diff --git a/arch/riscv/kerne=
l/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c<br clear=3D"none">&gt; index =
e60fbd8660c4..3ac341d296db 100644<br clear=3D"none">&gt; --- a/arch/riscv/k=
ernel/elf_kexec.c<br clear=3D"none">&gt; +++ b/arch/riscv/kernel/elf_kexec.=
c<br clear=3D"none">&gt; @@ -266,7 +266,7 @@ static void *elf_kexec_load(st=
ruct kimage *image, char *kernel_buf,<br clear=3D"none">&gt;&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  cmdline =3D modified_cmdline;<br =
clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; &nbsp;  }<br clear=3D"none">&gt;&nb=
sp; <br clear=3D"none">&gt; -#ifdef CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY<br=
 clear=3D"none">&gt; +#ifdef CONFIG_KEXEC_FILE<br clear=3D"none">&gt;&nbsp;=
 &nbsp; &nbsp; &nbsp;  /* Add purgatory to the image */<br clear=3D"none">&=
gt;&nbsp; &nbsp; &nbsp; &nbsp;  kbuf.top_down =3D true;<br clear=3D"none">&=
gt;&nbsp; &nbsp; &nbsp; &nbsp;  kbuf.mem =3D KEXEC_BUF_MEM_UNKNOWN;<br clea=
r=3D"none">&gt; @@ -280,7 +280,7 @@ static void *elf_kexec_load(struct kima=
ge *image, char *kernel_buf,<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sizeof(kernel=
_start), 0);<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; &nbsp;  if (ret)<br=
 clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
  pr_err("Error update purgatory ret=3D%d\n", ret);<br clear=3D"none">&gt; =
-#endif /* CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY */<br clear=3D"none">&gt; +=
#endif /* CONFIG_KEXEC_FILE */<br clear=3D"none"><br clear=3D"none">If so, =
we don't need the CONFIG_KEXEC_FILE ifdeffery because the<br clear=3D"none"=
>file elf_kexec.c relied on CONFIG_KEXEC_FILE enabling to build in.<br clea=
r=3D"none">We can just remove the "#ifdef CONFIG_KEXEC_FILE..#endif" as x86=
 does.<div class=3D"ydpb8ccb2eayqt2550855536" id=3D"ydpb8ccb2eayqtfd10119">=
<br clear=3D"none"><br clear=3D"none">&gt;&nbsp; <br clear=3D"none">&gt;&nb=
sp; &nbsp; &nbsp; &nbsp;  /* Add the initrd to the image */<br clear=3D"non=
e">&gt;&nbsp; &nbsp; &nbsp; &nbsp;  if (initrd !=3D NULL) {<br clear=3D"non=
e">&gt; diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild<br clear=3D"none=
">&gt; index d25ad1c19f88..ab181d187c23 100644<br clear=3D"none">&gt; --- a=
/arch/riscv/Kbuild<br clear=3D"none">&gt; +++ b/arch/riscv/Kbuild<br clear=
=3D"none">&gt; @@ -5,7 +5,7 @@ obj-$(CONFIG_BUILTIN_DTB) +=3D boot/dts/<br =
clear=3D"none">&gt;&nbsp; obj-y +=3D errata/<br clear=3D"none">&gt;&nbsp; o=
bj-$(CONFIG_KVM) +=3D kvm/<br clear=3D"none">&gt;&nbsp; <br clear=3D"none">=
&gt; -obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) +=3D purgatory/<br clear=
=3D"none">&gt; +obj-$(CONFIG_KEXEC_FILE) +=3D purgatory/<br clear=3D"none">=
&gt;&nbsp; <br clear=3D"none">&gt;&nbsp; # for cleaning<br clear=3D"none">&=
gt;&nbsp; subdir- +=3D boot<br clear=3D"none">&gt; diff --git a/arch/s390/K=
build b/arch/s390/Kbuild<br clear=3D"none">&gt; index a5d3503b353c..361aa01=
dbd49 100644<br clear=3D"none">&gt; --- a/arch/s390/Kbuild<br clear=3D"none=
">&gt; +++ b/arch/s390/Kbuild<br clear=3D"none">&gt; @@ -7,7 +7,7 @@ obj-$(=
CONFIG_S390_HYPFS)&nbsp; &nbsp; &nbsp; &nbsp; +=3D hypfs/<br clear=3D"none"=
>&gt;&nbsp; obj-$(CONFIG_APPLDATA_BASE)&nbsp; &nbsp; +=3D appldata/<br clea=
r=3D"none">&gt;&nbsp; obj-y&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; +=3D net/<br clear=3D"none">&gt;=
&nbsp; obj-$(CONFIG_PCI)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; +=
=3D pci/<br clear=3D"none">&gt; -obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY=
) +=3D purgatory/<br clear=3D"none">&gt; +obj-$(CONFIG_KEXEC_FILE)&nbsp; &n=
bsp; &nbsp;  +=3D purgatory/<br clear=3D"none">&gt;&nbsp; <br clear=3D"none=
">&gt;&nbsp; # for cleaning<br clear=3D"none">&gt;&nbsp; subdir- +=3D boot =
tools<br clear=3D"none">&gt; <br clear=3D"none"><br clear=3D"none"></div></=
div>
            </div>
        </div></body></html>
------=_Part_2327438_1021333898.1698238784088--
