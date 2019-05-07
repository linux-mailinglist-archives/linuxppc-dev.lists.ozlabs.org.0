Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 236AD1618E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 11:56:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yw3b3sJVzDqN7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 19:56:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yw2B20tHzDqHR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 19:54:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 44yw2B0rqSz9sB8; Tue,  7 May 2019 19:54:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44yw296RWtz9sB3;
 Tue,  7 May 2019 19:54:57 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v2] powerpc/64s: support nospectre_v2 cmdline option
In-Reply-To: <20190507024321.22281-1-cmr@informatik.wtf>
References: <20190507024321.22281-1-cmr@informatik.wtf>
Date: Tue, 07 May 2019 19:54:55 +1000
Message-ID: <87mujywpw0.fsf@concordia.ellerman.id.au>
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
Cc: "Christopher M. Riedl" <cmr@informatik.wtf>, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Christopher M. Riedl" <cmr@informatik.wtf> writes:
> diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
> index b33bafb8fcea..d775da9b9227 100644
> --- a/arch/powerpc/kernel/security.c
> +++ b/arch/powerpc/kernel/security.c
> @@ -391,6 +394,15 @@ static void toggle_count_cache_flush(bool enable)
>  
>  void setup_count_cache_flush(void)
>  {
> +	if (no_spectrev2) {
> +		if (security_ftr_enabled(SEC_FTR_BCCTRL_SERIALISED)
> +		    || security_ftr_enabled(SEC_FTR_COUNT_CACHE_DISABLED))
> +			pr_warn("Spectre v2 mitigations not under software control, can't disable\n");
> +
> +		toggle_count_cache_flush(false);
> +		return;
> +	}
> +
>  	toggle_count_cache_flush(true);
>  }

I'm nit-picking, but would it be better as:

void setup_count_cache_flush(void)
{
	bool enable = true;

	if (no_spectrev2) {
		if (security_ftr_enabled(SEC_FTR_BCCTRL_SERIALISED)
		    || security_ftr_enabled(SEC_FTR_COUNT_CACHE_DISABLED))
			pr_warn("Spectre v2 mitigations not under software control, can't disable\n");

		enable = false;
	}

	toggle_count_cache_flush(enable);
}

???

cheers
