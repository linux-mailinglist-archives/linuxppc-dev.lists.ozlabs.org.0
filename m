Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC79E3AE12B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 01:59:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7V5P0853z3bxV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 09:59:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ttLoaFZ3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ttLoaFZ3; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7V4t0k5Pz2yYV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 09:59:25 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id v7so12703494pgl.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 16:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=7U6CzGv2e/d/9047/ln4AbfjZylQ7TJyWzhvRZicX1k=;
 b=ttLoaFZ32+SckRm3H2Y4vXJOF8o6EabyWpvbGR62l3yPzqtMmRGf4EFBU6KPuDaEXC
 kqMs9UYHqY06J78l4msarVGie30SsXzdsbsxBTmFz4zmIi9P0T2DPeqopfjKvHrBfocA
 UOjAnzQH1MSXUj7MPFEjvPRO3lG3JGntxhjDjmzjICTKQVTXPjOAO69U/tc7UySsTVso
 6TmoG86lusyS5msZFZcELwj+kC8JPWmz8g1Pp4vpA32f+ZpCUS0Kma4y/1oTzaWQ5W5n
 MGEqfHXlZBacdH15smKgDmzC065ytSqXLp6MHk04xS1J6U6nojEb1PdXpZy2IQpFMSU2
 b22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=7U6CzGv2e/d/9047/ln4AbfjZylQ7TJyWzhvRZicX1k=;
 b=OaqnBMpbKntLpF40YE5h9oeLi/VEQjd6WpfkZDD85AGHCS/mpN53gY30jjrR61Lzak
 +umYLXM/PXm8VXpYFwAl1gLW7hp9/wndFpMTgkxL72kxkX9bF6nmbjWieRNwn1PVbGWM
 Kg+SRTIaEMjD8O6BBGokV0IhHs/P9J4Yv69MJihki1j9fgycLSh3C8ecE1nTTkQxaYe+
 nfcldbw3lqqpUMco8uKb7Ovm3V3MalDMyvYaQf7MGt9N2pDAwgC+1bggj3Q82a8PBlzk
 HQei3YIuDvMW8wQVG5/OGUFZ0fUwei/vXaIdsQcVOPzaQ6Yhpyneo9C5Wk+q88219hRB
 dPHQ==
X-Gm-Message-State: AOAM531ncBZQ9b6P3OcqRnGWuiwE5XUk7/eEshUfKX7g0nx3OjMhrlrA
 h9Vvi77dP/Tnw11bOt1bqFg=
X-Google-Smtp-Source: ABdhPJxxKUdMS/ugL34eltdY7w7K41j11J0NvfXCSkGBnE77Cyk2pDLNNjaK019W3vgupInJdGY55g==
X-Received: by 2002:aa7:949c:0:b029:2fa:c881:dd0 with SMTP id
 z28-20020aa7949c0000b02902fac8810dd0mr16755067pfk.9.1624233559655; 
 Sun, 20 Jun 2021 16:59:19 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm545873pgh.34.2021.06.20.16.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 16:59:19 -0700 (PDT)
Date: Mon, 21 Jun 2021 09:59:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: arch/powerpc/kvm/book3s_hv_nested.c:264:6: error: stack frame
 size of 2304 bytes in function 'kvmhv_enter_nested_guest'
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
References: <202104031853.vDT0Qjqj-lkp@intel.com>
In-Reply-To: <202104031853.vDT0Qjqj-lkp@intel.com>
MIME-Version: 1.0
Message-Id: <1624232938.d90brlmh3p.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: kbuild-all@lists.01.org, Kees Cook <keescook@chromium.org>,
 clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from kernel test robot's message of April 3, 2021 8:47 pm:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   d93a0d43e3d0ba9e19387be4dae4a8d5b175a8d7
> commit: 97e4910232fa1f81e806aa60c25a0450276d99a2 linux/compiler-clang.h: =
define HAVE_BUILTIN_BSWAP*
> date:   3 weeks ago
> config: powerpc64-randconfig-r006-20210403 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 0fe8=
af94688aa03c01913c2001d6a1a911f42ce6)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc64 cross compiling tool for clang build
>         # apt-get install binutils-powerpc64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D97e4910232fa1f81e806aa60c25a0450276d99a2
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 97e4910232fa1f81e806aa60c25a0450276d99a2
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dpowerpc64=20
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
>>> arch/powerpc/kvm/book3s_hv_nested.c:264:6: error: stack frame size of 2=
304 bytes in function 'kvmhv_enter_nested_guest' [-Werror,-Wframe-larger-th=
an=3D]
>    long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>         ^
>    1 error generated.
>=20
>=20
> vim +/kvmhv_enter_nested_guest +264 arch/powerpc/kvm/book3s_hv_nested.c

Not much changed here recently. It's not that big a concern because it's=20
only called in the KVM ioctl path, not in any deep IO paths or anything,
and doesn't recurse. Might be a bit of inlining or stack spilling put it
over the edge.

powerpc does make it an error though, would be good to avoid that so the
robot doesn't keep tripping over.

Thanks,
Nick


>=20
> afe75049303f75 Ravi Bangoria        2020-12-16  263 =20
> 360cae313702cd Paul Mackerras       2018-10-08 @264  long kvmhv_enter_nes=
ted_guest(struct kvm_vcpu *vcpu)
> 360cae313702cd Paul Mackerras       2018-10-08  265  {
> 360cae313702cd Paul Mackerras       2018-10-08  266  	long int err, r;
> 360cae313702cd Paul Mackerras       2018-10-08  267  	struct kvm_nested_g=
uest *l2;
> 360cae313702cd Paul Mackerras       2018-10-08  268  	struct pt_regs l2_r=
egs, saved_l1_regs;
> afe75049303f75 Ravi Bangoria        2020-12-16  269  	struct hv_guest_sta=
te l2_hv =3D {0}, saved_l1_hv;
> 360cae313702cd Paul Mackerras       2018-10-08  270  	struct kvmppc_vcore=
 *vc =3D vcpu->arch.vcore;
> 360cae313702cd Paul Mackerras       2018-10-08  271  	u64 hv_ptr, regs_pt=
r;
> 360cae313702cd Paul Mackerras       2018-10-08  272  	u64 hdec_exp;
> 360cae313702cd Paul Mackerras       2018-10-08  273  	s64 delta_purr, del=
ta_spurr, delta_ic, delta_vtb;
> 360cae313702cd Paul Mackerras       2018-10-08  274  	u64 mask;
> 360cae313702cd Paul Mackerras       2018-10-08  275  	unsigned long lpcr;
> 360cae313702cd Paul Mackerras       2018-10-08  276 =20
> 360cae313702cd Paul Mackerras       2018-10-08  277  	if (vcpu->kvm->arch=
.l1_ptcr =3D=3D 0)
> 360cae313702cd Paul Mackerras       2018-10-08  278  		return H_NOT_AVAIL=
ABLE;
> 360cae313702cd Paul Mackerras       2018-10-08  279 =20
> 360cae313702cd Paul Mackerras       2018-10-08  280  	/* copy parameters =
in */
> 360cae313702cd Paul Mackerras       2018-10-08  281  	hv_ptr =3D kvmppc_g=
et_gpr(vcpu, 4);
> 1508c22f112ce1 Alexey Kardashevskiy 2020-06-09  282  	regs_ptr =3D kvmppc=
_get_gpr(vcpu, 5);
> 1508c22f112ce1 Alexey Kardashevskiy 2020-06-09  283  	vcpu->srcu_idx =3D =
srcu_read_lock(&vcpu->kvm->srcu);
> afe75049303f75 Ravi Bangoria        2020-12-16  284  	err =3D kvmhv_read_=
guest_state_and_regs(vcpu, &l2_hv, &l2_regs,
> afe75049303f75 Ravi Bangoria        2020-12-16  285  					      hv_ptr, r=
egs_ptr);
> 1508c22f112ce1 Alexey Kardashevskiy 2020-06-09  286  	srcu_read_unlock(&v=
cpu->kvm->srcu, vcpu->srcu_idx);
> 360cae313702cd Paul Mackerras       2018-10-08  287  	if (err)
> 360cae313702cd Paul Mackerras       2018-10-08  288  		return H_PARAMETER=
;
> 1508c22f112ce1 Alexey Kardashevskiy 2020-06-09  289 =20
> 10b5022db7861a Suraj Jitindar Singh 2018-10-08  290  	if (kvmppc_need_byt=
eswap(vcpu))
> 10b5022db7861a Suraj Jitindar Singh 2018-10-08  291  		byteswap_hv_regs(&=
l2_hv);
> afe75049303f75 Ravi Bangoria        2020-12-16  292  	if (l2_hv.version >=
 HV_GUEST_STATE_VERSION)
> 360cae313702cd Paul Mackerras       2018-10-08  293  		return H_P2;
> 360cae313702cd Paul Mackerras       2018-10-08  294 =20
> 10b5022db7861a Suraj Jitindar Singh 2018-10-08  295  	if (kvmppc_need_byt=
eswap(vcpu))
> 10b5022db7861a Suraj Jitindar Singh 2018-10-08  296  		byteswap_pt_regs(&=
l2_regs);
> 9d0b048da788c1 Suraj Jitindar Singh 2018-10-08  297  	if (l2_hv.vcpu_toke=
n >=3D NR_CPUS)
> 9d0b048da788c1 Suraj Jitindar Singh 2018-10-08  298  		return H_PARAMETER=
;
> 9d0b048da788c1 Suraj Jitindar Singh 2018-10-08  299 =20
> 360cae313702cd Paul Mackerras       2018-10-08  300  	/* translate lpid *=
/
> 360cae313702cd Paul Mackerras       2018-10-08  301  	l2 =3D kvmhv_get_ne=
sted(vcpu->kvm, l2_hv.lpid, true);
> 360cae313702cd Paul Mackerras       2018-10-08  302  	if (!l2)
> 360cae313702cd Paul Mackerras       2018-10-08  303  		return H_PARAMETER=
;
> 360cae313702cd Paul Mackerras       2018-10-08  304  	if (!l2->l1_gr_to_h=
r) {
> 360cae313702cd Paul Mackerras       2018-10-08  305  		mutex_lock(&l2->tl=
b_lock);
> 360cae313702cd Paul Mackerras       2018-10-08  306  		kvmhv_update_ptbl_=
cache(l2);
> 360cae313702cd Paul Mackerras       2018-10-08  307  		mutex_unlock(&l2->=
tlb_lock);
> 360cae313702cd Paul Mackerras       2018-10-08  308  	}
> 360cae313702cd Paul Mackerras       2018-10-08  309 =20
> 360cae313702cd Paul Mackerras       2018-10-08  310  	/* save l1 values o=
f things */
> 360cae313702cd Paul Mackerras       2018-10-08  311  	vcpu->arch.regs.msr=
 =3D vcpu->arch.shregs.msr;
> 360cae313702cd Paul Mackerras       2018-10-08  312  	saved_l1_regs =3D v=
cpu->arch.regs;
> 360cae313702cd Paul Mackerras       2018-10-08  313  	kvmhv_save_hv_regs(=
vcpu, &saved_l1_hv);
> 360cae313702cd Paul Mackerras       2018-10-08  314 =20
> 360cae313702cd Paul Mackerras       2018-10-08  315  	/* convert TB value=
s/offsets to host (L0) values */
> 360cae313702cd Paul Mackerras       2018-10-08  316  	hdec_exp =3D l2_hv.=
hdec_expiry - vc->tb_offset;
> 360cae313702cd Paul Mackerras       2018-10-08  317  	vc->tb_offset +=3D =
l2_hv.tb_offset;
> 360cae313702cd Paul Mackerras       2018-10-08  318 =20
> 360cae313702cd Paul Mackerras       2018-10-08  319  	/* set L1 state to =
L2 state */
> 360cae313702cd Paul Mackerras       2018-10-08  320  	vcpu->arch.nested =
=3D l2;
> 360cae313702cd Paul Mackerras       2018-10-08  321  	vcpu->arch.nested_v=
cpu_id =3D l2_hv.vcpu_token;
> 360cae313702cd Paul Mackerras       2018-10-08  322  	vcpu->arch.regs =3D=
 l2_regs;
> 360cae313702cd Paul Mackerras       2018-10-08  323  	vcpu->arch.shregs.m=
sr =3D vcpu->arch.regs.msr;
> 360cae313702cd Paul Mackerras       2018-10-08  324  	mask =3D LPCR_DPFD =
| LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
> 360cae313702cd Paul Mackerras       2018-10-08  325  		LPCR_LPES | LPCR_M=
ER;
> 360cae313702cd Paul Mackerras       2018-10-08  326  	lpcr =3D (vc->lpcr =
& ~mask) | (l2_hv.lpcr & mask);
> 73937deb4b2d7f Suraj Jitindar Singh 2018-10-08  327  	sanitise_hv_regs(vc=
pu, &l2_hv);
> 360cae313702cd Paul Mackerras       2018-10-08  328  	restore_hv_regs(vcp=
u, &l2_hv);
> 360cae313702cd Paul Mackerras       2018-10-08  329 =20
> 360cae313702cd Paul Mackerras       2018-10-08  330  	vcpu->arch.ret =3D =
RESUME_GUEST;
> 360cae313702cd Paul Mackerras       2018-10-08  331  	vcpu->arch.trap =3D=
 0;
> 360cae313702cd Paul Mackerras       2018-10-08  332  	do {
> 360cae313702cd Paul Mackerras       2018-10-08  333  		if (mftb() >=3D hd=
ec_exp) {
> 360cae313702cd Paul Mackerras       2018-10-08  334  			vcpu->arch.trap =
=3D BOOK3S_INTERRUPT_HV_DECREMENTER;
> 360cae313702cd Paul Mackerras       2018-10-08  335  			r =3D RESUME_HOST=
;
> 360cae313702cd Paul Mackerras       2018-10-08  336  			break;
> 360cae313702cd Paul Mackerras       2018-10-08  337  		}
> 8c99d34578628b Tianjia Zhang        2020-04-27  338  		r =3D kvmhv_run_si=
ngle_vcpu(vcpu, hdec_exp, lpcr);
> 360cae313702cd Paul Mackerras       2018-10-08  339  	} while (is_kvmppc_=
resume_guest(r));
> 360cae313702cd Paul Mackerras       2018-10-08  340 =20
> 360cae313702cd Paul Mackerras       2018-10-08  341  	/* save L2 state fo=
r return */
> 360cae313702cd Paul Mackerras       2018-10-08  342  	l2_regs =3D vcpu->a=
rch.regs;
> 360cae313702cd Paul Mackerras       2018-10-08  343  	l2_regs.msr =3D vcp=
u->arch.shregs.msr;
> 360cae313702cd Paul Mackerras       2018-10-08  344  	delta_purr =3D vcpu=
->arch.purr - l2_hv.purr;
> 360cae313702cd Paul Mackerras       2018-10-08  345  	delta_spurr =3D vcp=
u->arch.spurr - l2_hv.spurr;
> 360cae313702cd Paul Mackerras       2018-10-08  346  	delta_ic =3D vcpu->=
arch.ic - l2_hv.ic;
> 360cae313702cd Paul Mackerras       2018-10-08  347  	delta_vtb =3D vc->v=
tb - l2_hv.vtb;
> 360cae313702cd Paul Mackerras       2018-10-08  348  	save_hv_return_stat=
e(vcpu, vcpu->arch.trap, &l2_hv);
> 360cae313702cd Paul Mackerras       2018-10-08  349 =20
> 360cae313702cd Paul Mackerras       2018-10-08  350  	/* restore L1 state=
 */
> 360cae313702cd Paul Mackerras       2018-10-08  351  	vcpu->arch.nested =
=3D NULL;
> 360cae313702cd Paul Mackerras       2018-10-08  352  	vcpu->arch.regs =3D=
 saved_l1_regs;
> 360cae313702cd Paul Mackerras       2018-10-08  353  	vcpu->arch.shregs.m=
sr =3D saved_l1_regs.msr & ~MSR_TS_MASK;
> 360cae313702cd Paul Mackerras       2018-10-08  354  	/* set L1 MSR TS fi=
eld according to L2 transaction state */
> 360cae313702cd Paul Mackerras       2018-10-08  355  	if (l2_regs.msr & M=
SR_TS_MASK)
> 360cae313702cd Paul Mackerras       2018-10-08  356  		vcpu->arch.shregs.=
msr |=3D MSR_TS_S;
> 360cae313702cd Paul Mackerras       2018-10-08  357  	vc->tb_offset =3D s=
aved_l1_hv.tb_offset;
> 360cae313702cd Paul Mackerras       2018-10-08  358  	restore_hv_regs(vcp=
u, &saved_l1_hv);
> 360cae313702cd Paul Mackerras       2018-10-08  359  	vcpu->arch.purr +=
=3D delta_purr;
> 360cae313702cd Paul Mackerras       2018-10-08  360  	vcpu->arch.spurr +=
=3D delta_spurr;
> 360cae313702cd Paul Mackerras       2018-10-08  361  	vcpu->arch.ic +=3D =
delta_ic;
> 360cae313702cd Paul Mackerras       2018-10-08  362  	vc->vtb +=3D delta_=
vtb;
> 360cae313702cd Paul Mackerras       2018-10-08  363 =20
> 360cae313702cd Paul Mackerras       2018-10-08  364  	kvmhv_put_nested(l2=
);
> 360cae313702cd Paul Mackerras       2018-10-08  365 =20
> 360cae313702cd Paul Mackerras       2018-10-08  366  	/* copy l2_hv_state=
 and regs back to guest */
> 10b5022db7861a Suraj Jitindar Singh 2018-10-08  367  	if (kvmppc_need_byt=
eswap(vcpu)) {
> 10b5022db7861a Suraj Jitindar Singh 2018-10-08  368  		byteswap_hv_regs(&=
l2_hv);
> 10b5022db7861a Suraj Jitindar Singh 2018-10-08  369  		byteswap_pt_regs(&=
l2_regs);
> 10b5022db7861a Suraj Jitindar Singh 2018-10-08  370  	}
> 1508c22f112ce1 Alexey Kardashevskiy 2020-06-09  371  	vcpu->srcu_idx =3D =
srcu_read_lock(&vcpu->kvm->srcu);
> afe75049303f75 Ravi Bangoria        2020-12-16  372  	err =3D kvmhv_write=
_guest_state_and_regs(vcpu, &l2_hv, &l2_regs,
> afe75049303f75 Ravi Bangoria        2020-12-16  373  					       hv_ptr, =
regs_ptr);
> 1508c22f112ce1 Alexey Kardashevskiy 2020-06-09  374  	srcu_read_unlock(&v=
cpu->kvm->srcu, vcpu->srcu_idx);
> 360cae313702cd Paul Mackerras       2018-10-08  375  	if (err)
> 360cae313702cd Paul Mackerras       2018-10-08  376  		return H_AUTHORITY=
;
> 360cae313702cd Paul Mackerras       2018-10-08  377 =20
> 360cae313702cd Paul Mackerras       2018-10-08  378  	if (r =3D=3D -EINTR=
)
> 360cae313702cd Paul Mackerras       2018-10-08  379  		return H_INTERRUPT=
;
> 360cae313702cd Paul Mackerras       2018-10-08  380 =20
> 873db2cd9a6d7f Suraj Jitindar Singh 2018-12-14  381  	if (vcpu->mmio_need=
ed) {
> 873db2cd9a6d7f Suraj Jitindar Singh 2018-12-14  382  		kvmhv_nested_mmio_=
needed(vcpu, regs_ptr);
> 873db2cd9a6d7f Suraj Jitindar Singh 2018-12-14  383  		return H_TOO_HARD;
> 873db2cd9a6d7f Suraj Jitindar Singh 2018-12-14  384  	}
> 873db2cd9a6d7f Suraj Jitindar Singh 2018-12-14  385 =20
> 360cae313702cd Paul Mackerras       2018-10-08  386  	return vcpu->arch.t=
rap;
> 360cae313702cd Paul Mackerras       2018-10-08  387  }
> 360cae313702cd Paul Mackerras       2018-10-08  388 =20
>=20
> :::::: The code at line 264 was first introduced by commit
> :::::: 360cae313702cdd0b90f82c261a8302fecef030a KVM: PPC: Book3S HV: Nest=
ed guest entry via hypercall
>=20
> :::::: TO: Paul Mackerras <paulus@ozlabs.org>
> :::::: CC: Michael Ellerman <mpe@ellerman.id.au>
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>=20
