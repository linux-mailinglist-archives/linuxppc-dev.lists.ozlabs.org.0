Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 410E08713AA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 03:36:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hZH9Sl80;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpfnx0J9wz3cPm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:36:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hZH9Sl80;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tpfn82YF4z30YR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 13:35:40 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6e6092a84f4so1591333b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 18:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709606137; x=1710210937; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+xrQxFkgiT2zXyroYi8UiH205d3grUsaMt27oLZHPg=;
        b=hZH9Sl80hvW64gn3f0/aHZ6nGqIH9JtmIT07nkx91kcQCTOafNY0ZYhmwjc5jUcZa4
         hi/Iki1aoUnjmy+ccU4Vv6S+bI+OVv4cT8x6ujUGCzJknQ8ccnRURYAb5eyheNsZ2QYp
         wqqiMiUKj1ViHeNpKrkp9/Z8eahpWFSfkMfTsiBdrLIrQypmRuHx+ZrcrFGr129Zka1P
         lro6OhTb1Bv1r/vGXrxoin2Oc1V4nnJjWz5yHQ3lkyRcbqHfiF6X7bLqTdaJRgtakcg3
         /AouHpV4oo40lXmT/BVMsmzkUjhJfpvOyZgUB2eS85fCmt3fvp4gWdG7RHJ4qQSzMHDU
         fCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709606137; x=1710210937;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N+xrQxFkgiT2zXyroYi8UiH205d3grUsaMt27oLZHPg=;
        b=uDDBIqWRppmutUNWiBsJPxH0Sf7weXs2WAn52PIjArq/lmH2gCnvDIonPUsv28v1WJ
         rV70/GoWwg0SvAdVkuqIsx4Jp6e5CYuc2/HN6k4vSozRSRkGZJVFthtPAeIu7x2FWJLf
         b1bxzyZyygYbn/rTMaYTlg1rdsUKXZh8pQDkHNAbtTurj7/bo5BGQRi7zvKmYS7Rk38X
         LxwkudsGRJkYpHpuHgs2mtLKivZkbR9V3ya5HhjSVfUPsIOqELdjxG8UW6fO3kcz1RJP
         yaiK4oMWBpOyrPpnCUbFoFQNN3HVWTRpfcnogJjbrrTTCu3wrjScXt6vCyZLU/IGuP4w
         W1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWlc0jJvx1Khev2ZrRMegORj05C92ywf9/aMMEMZiiNXr2stIWTxj1RW5M4NZRXOwmMaZQDzUST2l+Og4Guz8ryoDo/VQGN4iXPNUd5gg==
X-Gm-Message-State: AOJu0YwuonGv+pOjG246VqAFW1+kKszXAQSl++z3kEsnY39EPp2QYOn9
	gpbMybU0Klf9Q/qRHl3bqVTxeWD7+tOnpHBgjMS1Zzpn4VlRpWEh
X-Google-Smtp-Source: AGHT+IFWHPaDxpd9bOxuV1992+XKIgj0weLG7m7eGnp6z6kVYI8q6dzZSPJZ7bnSE7aWZLXV8NJXjA==
X-Received: by 2002:a05:6a20:7f96:b0:19e:c3a1:238d with SMTP id d22-20020a056a207f9600b0019ec3a1238dmr539679pzj.52.1709606137537;
        Mon, 04 Mar 2024 18:35:37 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id lp3-20020a056a003d4300b006e553f2b880sm7839075pfb.211.2024.03.04.18.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 18:35:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 12:35:31 +1000
Message-Id: <CZLGSMOBJAR4.1Q6P8X2V9X969@wheely>
Subject: Re: [kvm-unit-tests PATCH 14/32] powerpc: general interrupt tests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Jones" <ajones@ventanamicro.com>, "Thomas Huth"
 <thuth@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-15-npiggin@gmail.com>
 <1b89e399-1160-4fca-a9d7-89d60fc9a710@redhat.com>
 <20240301-65a02dd1ea0bc25377fb248f@orel>
 <b4a1b995-e5cd-40e9-afc1-445a9e5f6fa5@redhat.com>
 <20240301-0483593c146ffd3bbded2f69@orel>
In-Reply-To: <20240301-0483593c146ffd3bbded2f69@orel>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Joel
 Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Mar 2, 2024 at 12:14 AM AEST, Andrew Jones wrote:
> On Fri, Mar 01, 2024 at 02:57:04PM +0100, Thomas Huth wrote:
> > On 01/03/2024 14.45, Andrew Jones wrote:
> > > On Fri, Mar 01, 2024 at 01:41:22PM +0100, Thomas Huth wrote:
> > > > On 26/02/2024 11.12, Nicholas Piggin wrote:
> > > > > Add basic testing of various kinds of interrupts, machine check,
> > > > > page fault, illegal, decrementer, trace, syscall, etc.
> > > > >=20
> > > > > This has a known failure on QEMU TCG pseries machines where MSR[M=
E]
> > > > > can be incorrectly set to 0.
> > > >=20
> > > > Two questions out of curiosity:
> > > >=20
> > > > Any chance that this could be fixed easily in QEMU?
> > > >=20
> > > > Or is there a way to detect TCG from within the test? (for example,=
 we have
> > > > a host_is_tcg() function for s390x so we can e.g. use report_xfail(=
) for
> > > > tests that are known to fail on TCG there)
> > >=20
> > > If there's nothing better, then it should be possible to check the
> > > QEMU_ACCEL environment variable which will be there with the default
> > > environ.
> >=20
> > Well, but that's only available from the host side, not within the test
> > (i.e. the guest). So that does not help much with report_xfail...
>
> powerpc has had environment variables in guests since commit f266c3e8ef15
> ("powerpc: enable environ"). QEMU_ACCEL is one of the environment
> variables given to unit tests by default when ENVIRON_DEFAULT is 'yes', a=
s
> is the default set in configure. But...
>
> > I was rather thinking of something like checking the device tree, e.g. =
for
> > the compatible property in /hypervisor to see whether it's KVM or TCG..=
.?
>
> ...while QEMU_ACCEL will work when the environ is present, DT will always
> be present, so checking the hypervisor node sounds better to me.

Yeah I got that.

One issue with xfail I noted when looking at this earlier, is that it
*always* expects a fail, and fails if it succeeds. So if you fix a QEMU
bug then you introduce a fail to kvm-unit-tests. So we really want a
report_known_bug(cond, "SPRs look sane", "QEMU TCG before v9.0 and
POWER9 DD2.0 is known to fail..."); and that could report a maybe-fail
that doesn't make the test group fail.

Thanks,
Nick
