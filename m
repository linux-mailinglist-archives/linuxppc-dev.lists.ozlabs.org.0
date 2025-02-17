Return-Path: <linuxppc-dev+bounces-6269-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAFEA388A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 17:04:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxSCm0z7xz2xS8;
	Tue, 18 Feb 2025 03:04:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.71.208.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739808292;
	cv=none; b=WHjuEN+fhA4QeMSL0AV1jULlFA0Q+1mO//PrNXtgx9hRm6JI5DJRHgebJ//vxb9cTVk9PCF+u+WhPBzuifHv5kCgAageicQRxPvjzChED6X7h6c5V3SlxFAVAGPG08Mq77TUf5u2cKISUNysVwn58z7qnLz18y5/rcwg+rWfXUBJP9SMxmXbGYluHXMbd2Gee4vCRvXywWGUfd61PIMJRKVIuWrwaSEDEmr6HSxlP5f8Q+6Z5cn/Pcd1vTojmcHD3bLiI+bqdKrrYy2YhLpJCwIt4CGqeFvSHyZEoM2AkLeHabER/ukjxvpsFMV3INHtFB2J+9i3uXBSwrV4ZH7DkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739808292; c=relaxed/relaxed;
	bh=41DYd8S5nzPKADDvgmNVKMBye2mp3t96d0S4S/5x/MU=;
	h=Date:From:Message-ID:To:CC:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JYhFPkGhwBZ83+f5S7wO00Z04ZRGlCg4XfTzBLipZhRSnCxGethnCj0o3NG00gPsELDRUh+UFicgmR9QuPFcsXhTc8zJ+jVUhyxoQQlGRmKyIXLgfIvtA2VHkPDtw7t86fZQUnh3CGFjB0av5aTtUWjvDg2pQlfTHMfi26VMFiQt8d7bFzMM3LOGDIblR3ct79otiEUFagoadE0TB08WBUG5wEJ/KejakjHneE9lMC7CX1dV+mmIMaO7Lppr3uw07JY2h8+SmZyia0+o0VQxjU8ZNAf8ng2LeuKMyanJ0nA6P9E42Qk7qMbTZdbWRGiIyl+udAUrwEuW0jyM66lTWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sympatico.ca; dkim=pass (2048-bit key; unprotected) header.d=sympatico.ca header.i=@sympatico.ca header.a=rsa-sha256 header.s=selector1 header.b=gz01XTzy; dkim-atps=neutral; spf=pass (client-ip=209.71.208.12; helo=cmx-mtlrgo001.bell.net; envelope-from=al.dunsmuir@sympatico.ca; receiver=lists.ozlabs.org) smtp.mailfrom=sympatico.ca
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sympatico.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sympatico.ca header.i=@sympatico.ca header.a=rsa-sha256 header.s=selector1 header.b=gz01XTzy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sympatico.ca (client-ip=209.71.208.12; helo=cmx-mtlrgo001.bell.net; envelope-from=al.dunsmuir@sympatico.ca; receiver=lists.ozlabs.org)
X-Greylist: delayed 118 seconds by postgrey-1.37 at boromir; Tue, 18 Feb 2025 03:04:50 AEDT
Received: from cmx-mtlrgo001.bell.net (mta-mtl-002.bell.net [209.71.208.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxSCk05Zsz2xPL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 03:04:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sympatico.ca; s=selector1; t=1739808290; 
        bh=41DYd8S5nzPKADDvgmNVKMBye2mp3t96d0S4S/5x/MU=;
        h=Date:From:Message-ID:To:Subject:In-Reply-To:References:MIME-Version:Content-Type;
        b=gz01XTzy+vXowWW4auKghJgrxsyb5vuQ3qW7/MwctUIxZkT/2Kk74CUInfdXZ+WESPCeW1cwcvCFN1Zw0Xfyye7fqntc/0SlwH8dM4f2UR9ZDp6IYNtYXumzVxyhz2n/HNeJYx/hqdoJxxCXnW2OfmywzLQkvqI9C4UUzjHhnjgM6DTbX+Ser5zL3vd2gzXuVvBZKg25NcybSJ/GUEEU6uM8kPfX9M0eoAKk0J/84cksto39BuBkrNS14ZzD+xW6pfafuugpnhBA4l0VsLBQ83f0wh1Trmnx/1/PdFCmq0f+/BzV5VFfxm89A1sAVaMYKuiSThY6sNY4xD41i/PPQg==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-Originating-IP: [76.71.36.239]
X-RG-Env-Sender: al.dunsmuir@sympatico.ca
X-RG-Rigid: 67ACA5AF01009087
X-RazorGate-Vade: dmFkZTGMu6JuLVqLuz3zvC7c6OKmmoJx/rp/Y62QFXTbJQCSvND99pzidzTNP0FoNoeT+DVV8xqc/cEi0E1ntBW/hE4KCN6Y5/Ni7BTyiox9QjrVemw03MswMXHZpvAvsWBAkOZ3G6Zz7VLWHE9aDveciqCfBYF1iLLPcu30qskWnCtVh42odawXvEiks5/HOlebHKhQNnKlTJU1BEFwS519tsIPbAD0MwH5R9jHvLjFUFsHR6FdH6m44PlkEDlLcCW2r+/aueZlns20RoZH8enOhYvFxpVtXKdzuWPnhIONQOnkInmckYWGZ1lwu5jJ+PYbQTgR5kj9Vtui1jnZ/Np9zkU+ldnZD5K6ITn+XVjpSCxzNzCpwX23nGIrg+5S75VC+BkRpfAMbblt78BjS+84cxt16e2PHfT6T5iqOz2/7q6UnrAJ7Fq2pvjqJG3D4k0hrmBFudt0e6xH/aUsN/TQJt1P69E2DKWgIr+VDrtu9nP9jAF0PesKZSHNbB4w3Ho/wZScR4vp/K4LKriQfT8+HxRmp6RrX+4SOYiihZ/24VdXY9x4EjTPn2R4LX6e7bloKkykLD1Rp+mzc5GDxZz3WWVNmcCM0IMEdYUbDhKPsIn7VvSTHRWZz1Aw73BXQSd9YgVq+H1vf5IiY2LRxNlRdF/wS+rq6PUgD5mbNAxFAIQFbA
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from bucky.alba.lan (76.71.36.239) by cmx-mtlrgo001.bell.net (authenticated as al.dunsmuir@sympatico.ca)
        id 67ACA5AF01009087; Mon, 17 Feb 2025 11:02:15 -0500
Date: Mon, 17 Feb 2025 11:02:15 -0500
From: Al Dunsmuir <al.dunsmuir@sympatico.ca>
Message-ID: <1972812751.20250217110215@sympatico.ca>
To: Alexandru Elisei <alexandru.elisei@arm.com>, 
 Andrew Jones <andrew.jones@linux.dev>
CC: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, 
 david@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org, 
 kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
 kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, will@kernel.org, 
 julien.thierry.kdev@gmail.com, maz@kernel.org, oliver.upton@linux.dev, 
 suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
 andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 03/18] scripts: Refuse to run the tests if not configured for qemu
In-Reply-To: <Z6o/rbweZttGReir@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com> 
  <20250120164316.31473-4-alexandru.elisei@arm.com>
  <20250121-45faf6a9a9681c7c9ece5f44@orel> <Z6nX8YC8ZX9jFiLb@arm.com>
  <20250210-640ff37c16a0dbccb69f08ea@orel> <Z6o/rbweZttGReir@arm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Alexandru,

On Monday, February 10, 2025, 1:04:29 PM, you wrote:

> Hi Drew,

> On Mon, Feb 10, 2025 at 02:56:25PM +0100, Andrew Jones wrote:
>> On Mon, Feb 10, 2025 at 10:41:53AM +0000, Alexandru Elisei wrote:
>> > Hi Drew,
>> > 
>> > On Tue, Jan 21, 2025 at 03:48:55PM +0100, Andrew Jones wrote:
>> > > On Mon, Jan 20, 2025 at 04:43:01PM +0000, Alexandru Elisei wrote:
>> > <snip>
>> > > > ---
>> > > >  arm/efi/run             | 8 ++++++++
>> > > >  arm/run                 | 9 +++++++++
>> > > >  run_tests.sh            | 8 ++++++++
>> > > >  scripts/mkstandalone.sh | 8 ++++++++
>> > > >  4 files changed, 33 insertions(+)
>> > <snip>
>> > > > +case "$TARGET" in
>> > > > +qemu)
>> > > > +    ;;
>> > > > +*)
>> > > > +    echo "'$TARGET' not supported for standlone tests"
>> > > > +    exit 2
>> > > > +esac
>> > > 
>> > > I think we could put the check in a function in scripts/arch-run.bash and
>> > > just use the same error message for all cases.
>> > 
>> > Coming back to the series.
>> > 
>> > arm/efi/run and arm/run source scripts/arch-run.bash; run_tests.sh and
>> > scripts/mkstandalone.sh don't source scripts/arch-run.bash. There doesn't
>> > seem to be a common file that is sourced by all of them.
>> 
>> scripts/mkstandalone.sh uses arch-run.bash, see generate_test().

> Are you referring to this bit:

> generate_test ()
> {
>         <snip>
>         (echo "#!/usr/bin/env bash"
>          cat scripts/arch-run.bash "$TEST_DIR/run")

> I think scripts/arch-run.bash would need to be sourced for any functions defined
> there to be usable in mkstandalone.sh.

> What I was thinking is something like this:

> if ! vmm_supported $TARGET; then
>         echo "$0 does not support '$TARGET'"
>         exit 2
> fi

> Were you thinking of something else?

> I think mkstandalone should error at the top level (when you do make
> standalone), and not rely on the individual scripts to error if the VMM is
> not supported. That's because I think creating the test files, booting a
> machine and copying the files only to find out that kvm-unit-tests was
> misconfigured is a pretty suboptimal experience.

>> run_tests.sh doesn't, but I'm not sure it needs to validate TARGET
>> since it can leave that to the lower-level scripts.

> I put the check in arm/run, and removed it from run_tests.sh, and this is
> what I got:

> $ ./run_tests.sh selftest-setup
> SKIP selftest-setup (./arm/run does not supported 'kvmtool')

> which looks good to me.

Grammar nit:  This should be
SKIP selftest-setup (./arm/run does not support 'kvmtool')

Al

>> 
>> > 
>> > How about creating a new file in scripts (vmm.bash?) with only this
>> > function?
>> 
>> If we need a new file, then we can add one, but I'd try using
>> arch-run.bash or common.bash first.

> common.bash seems to work (and the name fits), so I'll give that a go.

> Thanks,
> Alex



