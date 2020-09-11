Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35037265B53
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 10:18:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnpYd0dqFzDqpB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 18:18:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnpWz6M3kzDqXt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 18:17:17 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.13])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BD11759E825E;
 Fri, 11 Sep 2020 10:17:14 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 11 Sep
 2020 10:17:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003ee35ee02-b75a-4f31-b232-c412f1676161,
 864FBEA0465FE1F0C66A9C6AC37977A76827B8ED) smtp.auth=groug@kaod.org
Date: Fri, 11 Sep 2020 10:17:13 +0200
From: Greg Kurz <groug@kaod.org>
To: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Do not allocate HPT for a nested
 guest
Message-ID: <20200911101713.38e3c442@bahia.lan>
In-Reply-To: <20200911080810.GD29521@kitsune.suse.cz>
References: <20200911041607.198092-1-farosas@linux.ibm.com>
 <20200911094536.72dd700a@bahia.lan>
 <20200911100133.49d22e82@bahia.lan>
 <20200911080810.GD29521@kitsune.suse.cz>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 1a7fb1dc-c974-4939-82b2-b46fcc54d8bb
X-Ovh-Tracer-Id: 3641723252167055654
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehledgtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedvgfdvieeukedvfeefleefkeevgfefgfejieeiveegjeduveeifefhleeghfefgeenucffohhmrghinhepohhpvghnghhrohhuphdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
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
Cc: david@gibson.dropbear.id.au, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, kvm@vger.kernel.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 11 Sep 2020 10:08:10 +0200
Michal Such=C3=A1nek <msuchanek@suse.de> wrote:

> On Fri, Sep 11, 2020 at 10:01:33AM +0200, Greg Kurz wrote:
> > On Fri, 11 Sep 2020 09:45:36 +0200
> > Greg Kurz <groug@kaod.org> wrote:
> >=20
> > > On Fri, 11 Sep 2020 01:16:07 -0300
> > > Fabiano Rosas <farosas@linux.ibm.com> wrote:
> > >=20
> > > > The current nested KVM code does not support HPT guests. This is
> > > > informed/enforced in some ways:
> > > >=20
> > > > - Hosts < P9 will not be able to enable the nested HV feature;
> > > >=20
> > > > - The nested hypervisor MMU capabilities will not contain
> > > >   KVM_CAP_PPC_MMU_HASH_V3;
> > > >=20
> > > > - QEMU reflects the MMU capabilities in the
> > > >   'ibm,arch-vec-5-platform-support' device-tree property;
> > > >=20
> > > > - The nested guest, at 'prom_parse_mmu_model' ignores the
> > > >   'disable_radix' kernel command line option if HPT is not supporte=
d;
> > > >=20
> > > > - The KVM_PPC_CONFIGURE_V3_MMU ioctl will fail if trying to use HPT.
> > > >=20
> > > > There is, however, still a way to start a HPT guest by using
> > > > max-compat-cpu=3Dpower8 at the QEMU machine options. This leads to =
the
> > > > guest being set to use hash after QEMU calls the KVM_PPC_ALLOCATE_H=
TAB
> > > > ioctl.
> > > >=20
> > > > With the guest set to hash, the nested hypervisor goes through the
> > > > entry path that has no knowledge of nesting (kvmppc_run_vcpu) and
> > > > crashes when it tries to execute an hypervisor-privileged (mtspr
> > > > HDEC) instruction at __kvmppc_vcore_entry:
> > > >=20
> > > > root@L1:~ $ qemu-system-ppc64 -machine pseries,max-cpu-compat=3Dpow=
er8 ...
> > > >=20
> > > > <snip>
> > > > [  538.543303] CPU: 83 PID: 25185 Comm: CPU 0/KVM Not tainted 5.9.0=
-rc4 #1
> > > > [  538.543355] NIP:  c00800000753f388 LR: c00800000753f368 CTR: c00=
00000001e5ec0
> > > > [  538.543417] REGS: c0000013e91e33b0 TRAP: 0700   Not tainted  (5.=
9.0-rc4)
> > > > [  538.543470] MSR:  8000000002843033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE=
>  CR: 22422882  XER: 20040000
> > > > [  538.543546] CFAR: c00800000753f4b0 IRQMASK: 3
> > > >                GPR00: c0080000075397a0 c0000013e91e3640 c0080000075=
5e600 0000000080000000
> > > >                GPR04: 0000000000000000 c0000013eab19800 c000001394d=
e0000 00000043a054db72
> > > >                GPR08: 00000000003b1652 0000000000000000 00000000000=
00000 c0080000075502e0
> > > >                GPR12: c0000000001e5ec0 c0000007ffa74200 c0000013eab=
19800 0000000000000008
> > > >                GPR16: 0000000000000000 c00000139676c6c0 c000000001d=
23948 c0000013e91e38b8
> > > >                GPR20: 0000000000000053 0000000000000000 00000000000=
00001 0000000000000000
> > > >                GPR24: 0000000000000001 0000000000000001 00000000000=
00000 0000000000000001
> > > >                GPR28: 0000000000000001 0000000000000053 c0000013eab=
19800 0000000000000001
> > > > [  538.544067] NIP [c00800000753f388] __kvmppc_vcore_entry+0x90/0x1=
04 [kvm_hv]
> > > > [  538.544121] LR [c00800000753f368] __kvmppc_vcore_entry+0x70/0x10=
4 [kvm_hv]
> > > > [  538.544173] Call Trace:
> > > > [  538.544196] [c0000013e91e3640] [c0000013e91e3680] 0xc0000013e91e=
3680 (unreliable)
> > > > [  538.544260] [c0000013e91e3820] [c0080000075397a0] kvmppc_run_cor=
e+0xbc8/0x19d0 [kvm_hv]
> > > > [  538.544325] [c0000013e91e39e0] [c00800000753d99c] kvmppc_vcpu_ru=
n_hv+0x404/0xc00 [kvm_hv]
> > > > [  538.544394] [c0000013e91e3ad0] [c0080000072da4fc] kvmppc_vcpu_ru=
n+0x34/0x48 [kvm]
> > > > [  538.544472] [c0000013e91e3af0] [c0080000072d61b8] kvm_arch_vcpu_=
ioctl_run+0x310/0x420 [kvm]
> > > > [  538.544539] [c0000013e91e3b80] [c0080000072c7450] kvm_vcpu_ioctl=
+0x298/0x778 [kvm]
> > > > [  538.544605] [c0000013e91e3ce0] [c0000000004b8c2c] sys_ioctl+0x1d=
c/0xc90
> > > > [  538.544662] [c0000013e91e3dc0] [c00000000002f9a4] system_call_ex=
ception+0xe4/0x1c0
> > > > [  538.544726] [c0000013e91e3e20] [c00000000000d140] system_call_co=
mmon+0xf0/0x27c
> > > > [  538.544787] Instruction dump:
> > > > [  538.544821] f86d1098 60000000 60000000 48000099 e8ad0fe8 e8c500a=
0 e9264140 75290002
> > > > [  538.544886] 7d1602a6 7cec42a6 40820008 7d0807b4 <7d164ba6> 7d083=
a14 f90d10a0 480104fd
> > > > [  538.544953] ---[ end trace 74423e2b948c2e0c ]---
> > > >=20
> > > > This patch makes the KVM_PPC_ALLOCATE_HTAB ioctl fail when running =
in
> > > > the nested hypervisor, causing QEMU to abort.
> > > >=20
> > > > Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> > > > Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> > > > ---
> > >=20
> > > LGTM
> > >=20
> > > Reviewed-by: Greg Kurz <groug@kaod.org>
> > >=20
> > > >  arch/powerpc/kvm/book3s_hv.c | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >=20
> > > > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s=
_hv.c
> > > > index 4ba06a2a306c..764b6239ef72 100644
> > > > --- a/arch/powerpc/kvm/book3s_hv.c
> > > > +++ b/arch/powerpc/kvm/book3s_hv.c
> > > > @@ -5250,6 +5250,12 @@ static long kvm_arch_vm_ioctl_hv(struct file=
 *filp,
> > > >  	case KVM_PPC_ALLOCATE_HTAB: {
> > > >  		u32 htab_order;
> > > > =20
> > > > +		/* If we're a nested hypervisor, we currently only support radix=
 */
> > > > +		if (kvmhv_on_pseries()) {
> > > > +			r =3D -EOPNOTSUPP;
> >=20
> > According to POSIX [1]:
> >=20
> > [ENOTSUP]
> > Not supported. The implementation does not support the requested featur=
e or value.
> >=20
> > [EOPNOTSUPP]
> > Operation not supported on socket. The type of socket (address family o=
r protocol) does not support the requested operation. A conforming implemen=
tation may assign the same values for [EOPNOTSUPP] and [ENOTSUP].
> >=20
> > Even if these two happen to be equal in linux, it seems that ENOTSUP, w=
hich
> > doesn't refer to sockets, is more appropriate.
> >=20
> > [1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/V2_chap0=
2.html
>=20
> Which in Linux kernel maps to a completely bogus value not recognized by
> userspace.
>=20

There's no such thing as ENOTSUP in Linux actually :)

Linux has ENOTSUPP which indeed doesn't map to anything usable by
userspace... very unfortunate naming :-(

> So when you mean ENOTSUP use EOPNOTSUPP in Linux.
>=20

Right. So this patch is good as it is.

Cheers,

--
Greg

> Thanks
>=20
> Michal

