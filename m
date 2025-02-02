Return-Path: <linuxppc-dev+bounces-5772-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B90A25022
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2025 22:41:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmNPG5L7mz2xjL;
	Mon,  3 Feb 2025 08:41:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738532498;
	cv=none; b=Bf/lQQEKZQ4TNtWx93nXdnwF+oFnIQ4SbXVXf9b0DluHSpsbqB2TQQYVJgOcBK2B2pLNKM9Th+adjG89TBFND4YxaEVrJvwDtfSz58icwbVL1wIC0ixbWHiaoIiHnN9UK+3yqum7JSDtCHUd6+0OE9qu0tCsYF2E70hOa0rf/UgjJ5We+tsYjgoezM3VPlayfiMQE8rAQOXEzPK2DCnW0dMv3SjyhVv1569hcbfH4Q+dTVs1XC0Z5k+DBStmNCvQrioGugjllwSWEjYNH3oPUMdWVGY8BlXDGJDpNVkJPeFD8kzK8qx2+5gd5XdZAef3OBdzifHNGVXudppIsWwpJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738532498; c=relaxed/relaxed;
	bh=G2eHfhQuejodnDOibyT663weFQ71Yl8E8QZl/5oxVv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWPzAHfG604kbaL+OICQt777ir7acF9RP+x9+aDcjnibMBpigjHqWdDz/Po8g6b3gKQKvZ6RoSdMnij1SiomYcQ6g4hs8OAFGPb2B5uEfpUAFdN/XxMJe2R4OkJpjIpekYYRDEqth6xFaotdeK2p7f8twk11ev+SjE4a8WDY3HcsTwKYRC/cIPqlZezuUCClxOJ0dvkvHmbs7cn6vahLCBECOayfpvz7ATlb3bEPPvmUQ6ElL79COA2rmq7IGaKHPpFANDV1Ruj1zCqoJ+45OhkX99TNVGmylxUsYGYPA6tmEo9/OlnlgizuXKxoZmAc4jWnX+/CTOc+UsuWpWohEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=hAShhqeY; dkim-atps=neutral; spf=pass (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=hAShhqeY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 415 seconds by postgrey-1.37 at boromir; Mon, 03 Feb 2025 08:41:35 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YmNPC6PZqz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2025 08:41:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1738532484; x=1739137284; i=j.neuschaefer@gmx.net;
	bh=G2eHfhQuejodnDOibyT663weFQ71Yl8E8QZl/5oxVv0=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hAShhqeYRuvvqZYXkV/EWtk/QinyFoplSkD+1EKyuWt++Rik55XAfUwuPHWx42sK
	 NY1TufVIBmRldyVZSi3Vdm4y6LF64wMWUXW02Qkh3PzVC4cylLYojSqf1iXs5p0q9
	 lYgEDzDawIp5qgMVK39ar/ym7LN20WBo5SOZoTGLPI7qDXGEBDDaP/aWsyZ+2IcED
	 l2DXwVi4zHKUQhziLGJFnTg4Jpu3usruWuqmYWZIsqhxKLFrHOEaTGoN0Mops6Gmx
	 uIRB2/1pZ9YdxAHUo0ky79AxOlk8+jNM3BJpUgCchYd9cjnax2qpxRDLchYYrd2Bt
	 00KrOXHAE5lbNEPtXw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.210.218]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAfYw-1tlHAA11D6-007KTC; Sun, 02
 Feb 2025 22:33:46 +0100
Date: Sun, 2 Feb 2025 22:33:36 +0100
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: "A. Wilcox" <AWilcox@wilcox-tech.com>
Cc: Arnd Bergmann <arnd@kernel.org>, kvm@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Graf <graf@amazon.com>, Crystal Wood <crwood@redhat.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/5] powerpc: kvm: drop 32-bit book3s
Message-ID: <Z5_ksID8Gv_Tg5F7@probook>
References: <20241221214223.3046298-1-arnd@kernel.org>
 <20241221214223.3046298-5-arnd@kernel.org>
 <9B9E07F0-3373-4F59-BE4C-E6C425B3C36D@Wilcox-Tech.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9B9E07F0-3373-4F59-BE4C-E6C425B3C36D@Wilcox-Tech.com>
X-Provags-ID: V03:K1:9/xKYk+mj967yFEydW37x3unDxvlzZDdriScJwSUFGFBVPwz408
 R4O7IVTtnXePPO+gVIX8jktVCSK3SLk5KSpqblHo9ocA7Uo1TTIFaSqN1IJ0B/nSnHdz+v4
 BQJUDyiTjBjastoDpF/hhIklw774C2Nk4pN/wxnwAA2nZ2/XzPYAWN671OjQUfPE/hjZF1w
 siMMlhFzAtG6iMd99XMIg==
UI-OutboundReport: notjunk:1;M01:P0:KsFYa4kZloA=;Dyq1l2cy9rS3hjvZxMZ1ZB6C2Gc
 Z2+6OhGfV1eNmfEmR9JoJvHrqmGRL8gUS5laXPKlLx8mvbQURLJIw71MCtJZS5rSBVnlQaqvw
 vF02svj9qWtKBf3LpSusMYtdVbD9UdLLuNM4b+X9u17SGmh6Uf3BBhHW5pWG1T9vj43QFnu7s
 eb7gapSwDJqjcEZRtgdeS+hx6y33d4kl79cC04piw3coTxL/vGvBJhNxSWZen8CZRmCrBstLu
 SaPptbJcV37hWT4YQCoSNurN+ooxEKL3Q4UJzXQQPQHX6/MMBouOVQAfcyulRBPy+Dz2UKlst
 J4HpqYX8xA8oAXGR4nAE8AfBJb0W62M4LPVwY5oMQPNgENwUg+ZEeuB4ptEOEOt/DJ7troct9
 diJz+52v8V1g+kOK1GQO6OZcir83OrIHtTiAu+0mrCG6LO/jAwuBUJ0lQ5C1l0TE8rvLTlFjE
 9Tu4J3a+lv+DA/38GRB5YbpKEVOlnEobrXFa5fnDyzQsMdHoIbWVE4W5PfyWcJRa1ZfyInlCm
 Bt+Br3tJUhZzKyAOfTraTjpdofcBZvxA79RNWbucZvhWJj5QTuG/6VvuDbO72UjLV7W1sWp18
 nflLRHs/l9TFD23RXkO6nH4g17IoKyt+Hd9HO8r24XKlqLhPBhMdAY82EbflJvOx6LHGwe8nL
 3iLVC9HHjZeHHPkzAZ0f4d8N5NankFUESO6usmRnA/Xpv3blVeZFXoS68ST85gFntXQF/eIiw
 cq3xpGRRNcC8I8uQu5VyIBoHfBFKE5mbxmMgpoyyCfWUXGNkKq7JrfF+GuZq2g8mooJ1EL82V
 /VKedl+GIWzbAJFdnXcr31EN4ssVQMHKTHpxeae2dfYfU1nQf5lp6TADqXP6wq+FJJt7Gflu3
 FbysEMNwktZASs+7jpz75Kp+1Md0tkuRo2I6tyTAKA8Eg6MDWxdck4XSFNTxm2bHouaGF7VkB
 Iupu+6oS1QgZI4hCXQcQlMXrn0SALb58t8XEV9lqqLUvsELiRtid6enNMCfoYzVSkw+TjxJKf
 A3tCFrPBthtuhPWEK+u4D7I34uO2gEoVOLs+/O5a77SBB1p7mzVZBf0TSnkdEntsXnfoe9iuw
 a5ygfh/lwZWixMymSLq7OPHnoKYcbWlcq8lbsyk9hl+TDi6ByLDnHXO5S3j2kjCVKnjkQTFxB
 3arR5BY1EJr2s9QJ87NE96w+rMD9b850SP8sGafW3hspVo3clANW2jCr+QiXEXrTotSQkJb5l
 EILyR8EsbICtXADfuLK79++hTl8V8W+BvZ6uGnlYX3W+FS5BsyNwR3AKJ0UMQWAWWd7rWpGuD
 J5tlSGvUlCDbVfDur+DA7Xjm99U8hdZGF3uPET6L6t6DbcC3Xe3crFIAjjxpOYMo5Wc
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Dec 21, 2024 at 08:13:12PM -0600, A. Wilcox wrote:
> On Dec 21, 2024, at 3:42=E2=80=AFPM, Arnd Bergmann <arnd@kernel.org> wro=
te:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Support for KVM on 32-bit Book III-s implementations was added in 2010
> > and supports PowerMac, CHRP, and embedded platforms using the Freescal=
e G4
> > (mpc74xx), e300 (mpc83xx) and e600 (mpc86xx) CPUs from 2003 to 2009.
> >
> > Earlier 603/604/750 machines might work but would be even more limited
> > by their available memory.
> >
> > The only likely users of KVM on any of these were the final Apple
> > PowerMac/PowerBook/iBook G4 models with 2GB of RAM that were at the hi=
gh
> > end 20 years ago but are just as obsolete as their x86-32 counterparts=
.
> > The code has been orphaned since 2023.
> >
> > There is still a need to support 32-bit guests in order to better
> > debug problems on ppc32 kernels. This should work in theory on both
> > 64-bit booke and on 64-bit book3s hosts, but it would be good to
> > confirm that this is still the case before the known working option
> > gets removed.
[...]
> That said, I would like to keep the support alive for more than just
> ppc32 kernel testing.  There are plenty of Power Macs with enough
> memory to run some environments within KVM.  Ad=C3=A9lie=E2=80=99s new r=
elease
> boots a full XFCE desktop in under 300 MB RAM, so even a 1 GB machine
> has enough memory to run AmigaOS, Mac OS 9, or another XFCE in KVM.

FWIW, I second this. I do intend to get KVM to run on my e300-based
board for some relatively light guests such as Mac OS 9. I suspect I
won't be able to contribute much to the maintenance, though.

Best regards,
J. Neusch=C3=A4fer

