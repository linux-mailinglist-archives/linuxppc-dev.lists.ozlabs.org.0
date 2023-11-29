Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3697FCC2E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 02:09:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MWXJgvfH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sg1ST621rz3dBg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 12:09:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MWXJgvfH;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sg1Rd4Qp1z3bx0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 12:08:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701220117;
	bh=wBhFEZBwpVw/gHKTxfsy5vdBLb+lUAIAkOZ/hGhamxQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MWXJgvfHJxliQBJkiXNpdWXvsPfgqvLUynOOGsEPC+D7Yi1QuhXmEfN+kMXE7CeG7
	 KnPLpSF4ktvj+swOi0eXMpV/JO1cOaCu70SgnmZ8sRPdkmwRTP+6c3PYp1RRDfS1aI
	 /Qyed0XlK0zbrTl1rKGgGQlvJkFIIT1uj0OlZuWStkm3ERSzHE+9MPvz9pHYv+y6bL
	 ZvL8fKh8T9mdNYOURZY5yfMY091t0Keiq7Of77u0caHbvFejdKjKjmS8usdJQR0PAT
	 RNrBCTf6vm0roULx2/sPjSw7fGhWapxX3X5zPrngGsycCbNCpABsFyYlJ3A2ocQU/A
	 yCVTJdjqXrT8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sg1RT02Gtz4wxY;
	Wed, 29 Nov 2023 12:08:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 13/13] powerpc/selftests: Add test for papr-sysparm
In-Reply-To: <20231117-papr-sys_rtas-vs-lockdown-v4-13-b794d8cb8502@linux.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-13-b794d8cb8502@linux.ibm.com>
Date: Wed, 29 Nov 2023 12:08:33 +1100
Message-ID: <87plzt2woe.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
writes:
> From: Nathan Lynch <nathanl@linux.ibm.com>
>
> Consistently testing system parameter access is a bit difficult by
> nature -- the set of parameters available depends on the model and
> system configuration, and updating a parameter should be considered a
> destructive operation reserved for the admin.
...
> diff --git a/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c b/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c
> new file mode 100644
> index 000000000000..fc25c03e8bc7
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c
> @@ -0,0 +1,164 @@
...
> +static int set_hmc0(void)
> +{
> +	struct papr_sysparm_io_block sp = {
> +		.parameter = 0, // HMC0, not a settable parameter
> +	};
> +	const int devfd = open(DEVPATH, O_RDONLY);
> +
> +	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
> +		    DEVPATH " not present");
> +
> +	FAIL_IF(devfd < 0);
> +
> +	// Ensure expected error
> +	FAIL_IF(ioctl(devfd, PAPR_SYSPARM_IOC_SET, &sp) != -1);
> +	FAIL_IF(errno != EPERM);
> +
> +	FAIL_IF(close(devfd) != 0);
> +
> +	return 0;
> +}

This one fails when run with qemu/KVM.

# selftests: powerpc: papr_sysparm
# test: open and close /dev/papr-sysparm without issuing commands
# tags: git_version:v6.7-rc2-35-g41ada9f713ae
# success: open and close /dev/papr-sysparm without issuing commands
# test: retrieve SPLPAR characteristics
# tags: git_version:v6.7-rc2-35-g41ada9f713ae
# success: retrieve SPLPAR characteristics
# test: verify EOPNOTSUPP for known-bad parameter
# tags: git_version:v6.7-rc2-35-g41ada9f713ae
# success: verify EOPNOTSUPP for known-bad parameter
# test: PAPR_SYSPARM_IOC_GET returns EFAULT on bad address
# tags: git_version:v6.7-rc2-35-g41ada9f713ae
# success: PAPR_SYSPARM_IOC_GET returns EFAULT on bad address
# test: PAPR_SYSPARM_IOC_SET returns EFAULT on bad address
# tags: git_version:v6.7-rc2-35-g41ada9f713ae
# success: PAPR_SYSPARM_IOC_SET returns EFAULT on bad address
# test: ensure EPERM on attempt to update HMC0
# tags: git_version:v6.7-rc2-35-g41ada9f713ae
# [FAIL] Test FAILED on line 113
# failure: ensure EPERM on attempt to update HMC0

It's returning EOPNOTSUPP.

Something like below would work to fix it.

cheers

diff --git a/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c b/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c
index fc25c03e8bc7..9d4850c25aed 100644
--- a/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c
+++ b/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c
@@ -110,6 +110,7 @@ static int set_hmc0(void)

        // Ensure expected error
        FAIL_IF(ioctl(devfd, PAPR_SYSPARM_IOC_SET, &sp) != -1);
+       SKIP_IF_MSG(errno == EOPNOTSUPP, "operation not supported");
        FAIL_IF(errno != EPERM);

        FAIL_IF(close(devfd) != 0);
