Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E581BDAD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 13:40:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BxQY2PGczDqNg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 21:40:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BxLc5pdnzDr1x
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 21:36:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=m6QUf84E; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49BxLb4jYvz9sRY;
 Wed, 29 Apr 2020 21:36:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588160216;
 bh=tHdjCSyj/K2oQz3cXbnPUTYVwYd6v0eaJsUiBnOB+cw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=m6QUf84EzHOH984uaj6O8S+mzUl1x3nVlvWVuZVRb/+fSl2CCFYtk9OGM7uUZlhTZ
 4wp643Qf6KJRN/8MGgfiS4u96DeGwhupDUsrybrUCRDbT77+FEv7YLcrL+G865LC57
 o3DY+4rwvg9VMqL+SusleGZvoVD1+R/e9YANjzNm4MfvQv0bczpCsw0rjljXaQfl10
 1DQRk42JhA0aJYt1q1wB0yAurELIXgSayCZmiKiklgTuf1s0suqtuarHFeAVGRLMyx
 51/qeUmut8aortHUu7ftx8+v7Zyi+ct5DxRa4s9IWr5P/UBmaesL1pu2M78/a1WyRv
 8Bs76ezyPHKLA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>, acme@kernel.org,
 linuxppc-dev@lists.ozlabs.org, sukadev@linux.vnet.ibm.com
Subject: Re: [PATCH v7 5/5] powerpc/hv-24x7: Update post_mobility_fixup() to
 handle migration
In-Reply-To: <20200327063642.26175-6-kjain@linux.ibm.com>
References: <20200327063642.26175-1-kjain@linux.ibm.com>
 <20200327063642.26175-6-kjain@linux.ibm.com>
Date: Wed, 29 Apr 2020 21:37:12 +1000
Message-ID: <877dxyfrpz.fsf@mpe.ellerman.id.au>
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 ravi.bangoria@linux.ibm.com, kjain@linux.ibm.com, jmario@redhat.com,
 namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kajol Jain <kjain@linux.ibm.com> writes:
> Function 'read_sys_info_pseries()' is added to get system parameter
> values like number of sockets and chips per socket.
> and it gets these details via rtas_call with token
> "PROCESSOR_MODULE_INFO".
>
> Incase lpar migrate from one system to another, system
> parameter details like chips per sockets or number of sockets might
> change. So, it needs to be re-initialized otherwise, these values
> corresponds to previous system values.
> This patch adds a call to 'read_sys_info_pseries()' from
> 'post-mobility_fixup()' to re-init the physsockets and physchips values.
>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/mobility.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
> index b571285f6c14..226accd6218b 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -371,6 +371,18 @@ void post_mobility_fixup(void)
>  	/* Possibly switch to a new RFI flush type */
>  	pseries_setup_rfi_flush();
>  
> +	/*
> +	 * Incase lpar migrate from one system to another, system

In case an LPAR migrates

> +	 * parameter details like chips per sockets and number of sockets
> +	 * might change. So, it needs to be re-initialized otherwise these
                             ^                                       ^
                             they need                               the
> +	 * values corresponds to previous system.
                  ^
                  will correspond to the

> +	 * Here, adding a call to read_sys_info_pseries() declared in

Adding is the wrong tense in a comment. When someone reads the comment
the code has already been added. Past tense would be right, but really
the comment shouldn't say what you did, it should say why.

> +	 * platforms/pseries/pseries.h to re-init the physsockets and
> +	 * physchips value.

Call read_sys_info_pseries() to reinitialise the values.

> +	 */
> +	if (IS_ENABLED(CONFIG_HV_PERF_CTRS) && IS_ENABLED(CONFIG_PPC_RTAS))
> +		read_sys_info_pseries();

The RTAS check is not needed. pseries always selects RTAS.

You shouldn't need the IS_ENABLED() check here though, do it with an
empty version in the header when CONFIG_HV_PERF_CTRS is not enabled.

cheers
