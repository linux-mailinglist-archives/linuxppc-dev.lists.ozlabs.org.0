Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF1865FF33
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 11:55:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NpKxT4NG7z3cBK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 21:55:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n8YsKGgV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NpKwb11pZz3bPW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Jan 2023 21:54:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n8YsKGgV;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NpKwZ6mygz4wgv;
	Fri,  6 Jan 2023 21:54:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1673002479;
	bh=zpE+WrqklrIwyUmVffTGSNAKKaVZ//kuqJZ75+S6Vwc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n8YsKGgV74swsuNo2Hx6NmNu7dyThzbGDonDsNz0BDkkQsW3unqhgGP7A1RGfQMPw
	 HSSSOHjCHN2ACupSCGn3ekz/gKEc4njG9/gG9NNpckQyEwiqZGFU5ijr2YEpXAOAdW
	 kfdQAiaw7d0fVCk8fLbliC5Rlv6Rsdd9LQMhJewXlE0aIk7agvJByTMm4hO35GmSmL
	 Mr1ZHFRdbXbz9PUebBjKuxGrReNxCvF2Wb0MyKLxv3dl7+14c+7N5nu1VJA1TabNMl
	 GE00nzRijOtyKPrxj/+7FXuW2bi53PzL0UWnZn+IZH5n+j269iqDqQams+OpNzK/T0
	 NQZqEy6KEcJTg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/4] powerpc/pseries: Implement signed update for PLPKS
 objects
In-Reply-To: <20221220071626.1426786-5-ajd@linux.ibm.com>
References: <20221220071626.1426786-1-ajd@linux.ibm.com>
 <20221220071626.1426786-5-ajd@linux.ibm.com>
Date: Fri, 06 Jan 2023 21:54:38 +1100
Message-ID: <87wn60gcgh.fsf@mpe.ellerman.id.au>
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
Cc: nayna@linux.ibm.com, gjoyce@linux.ibm.com, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> From: Nayna Jain <nayna@linux.ibm.com>
>
> The Platform Keystore provides a signed update interface which can be used
> to create, replace or append to certain variables in the PKS in a secure
> fashion, with the hypervisor requiring that the update be signed using the
> Platform Key.
>
> Implement an interface to the H_PKS_SIGNED_UPDATE hcall in the plpks
> driver to allow signed updates to PKS objects.
>
> (The plpks driver doesn't need to do any cryptography or otherwise handle
> the actual signed variable contents - that will be handled by userspace
> tooling.)
>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> [ajd: split patch, rewrite commit message, add timeout handling]
> Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hvcall.h      |  3 +-
>  arch/powerpc/platforms/pseries/plpks.c | 81 +++++++++++++++++++++++---
>  arch/powerpc/platforms/pseries/plpks.h |  5 ++
>  3 files changed, 79 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index 95fd7f9485d5..33b26c0cb69b 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -336,7 +336,8 @@
>  #define H_SCM_FLUSH		0x44C
>  #define H_GET_ENERGY_SCALE_INFO	0x450
>  #define H_WATCHDOG		0x45C
> -#define MAX_HCALL_OPCODE	H_WATCHDOG
> +#define H_PKS_SIGNED_UPDATE	0x454
> +#define MAX_HCALL_OPCODE	H_PKS_SIGNED_UPDATE
>  
>  /* Scope args for H_SCM_UNBIND_ALL */
>  #define H_UNBIND_SCOPE_ALL (0x1)
> diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
> index c5ae00a8a968..9e4401aabf4f 100644
> --- a/arch/powerpc/platforms/pseries/plpks.c
> +++ b/arch/powerpc/platforms/pseries/plpks.c
> @@ -30,9 +30,9 @@
>  #define MAX_NAME_SIZE	    239
>  #define MAX_DATA_SIZE	    4000
>  
> -#define PKS_FLUSH_MAX_TIMEOUT 5000 //msec
> -#define PKS_FLUSH_SLEEP	      10 //msec
> -#define PKS_FLUSH_SLEEP_RANGE 400
> +#define PKS_MAX_TIMEOUT		5000 // msec
> +#define PKS_FLUSH_SLEEP		10 // msec
> +#define PKS_FLUSH_SLEEP_RANGE	400
>  
>  static u8 *ospassword;
>  static u16 ospasswordlength;
> @@ -95,6 +95,12 @@ static int pseries_status_to_err(int rc)
>  		err = -ENOENT;
>  		break;
>  	case H_BUSY:
> +	case H_LONG_BUSY_ORDER_1_MSEC:
> +	case H_LONG_BUSY_ORDER_10_MSEC:
> +	case H_LONG_BUSY_ORDER_100_MSEC:
> +	case H_LONG_BUSY_ORDER_1_SEC:
> +	case H_LONG_BUSY_ORDER_10_SEC:
> +	case H_LONG_BUSY_ORDER_100_SEC:
>  		err = -EBUSY;
>  		break;
>  	case H_AUTHORITY:
> @@ -198,14 +204,17 @@ static struct label *construct_label(char *component, u8 varos, u8 *name,
>  				     u16 namelen)
>  {
>  	struct label *label;
> -	size_t slen;
> +	size_t slen = 0;
>  
>  	if (!name || namelen > MAX_NAME_SIZE)
>  		return ERR_PTR(-EINVAL);
>  
> -	slen = strlen(component);
> -	if (component && slen > sizeof(label->attr.prefix))
> -		return ERR_PTR(-EINVAL);
> +	// Support NULL component for signed updates
> +	if (component) {
> +		slen = strlen(component);
> +		if (slen > sizeof(label->attr.prefix))
> +			return ERR_PTR(-EINVAL);
> +	}
>  
>  	// The label structure must not cross a page boundary, so we align to the next power of 2
>  	label = kzalloc(roundup_pow_of_two(sizeof(*label)), GFP_KERNEL);
> @@ -372,7 +381,7 @@ static int plpks_confirm_object_flushed(struct label *label,
>  		usleep_range(PKS_FLUSH_SLEEP,
>  			     PKS_FLUSH_SLEEP + PKS_FLUSH_SLEEP_RANGE);
>  		timeout = timeout + PKS_FLUSH_SLEEP;
> -	} while (timeout < PKS_FLUSH_MAX_TIMEOUT);
> +	} while (timeout < PKS_MAX_TIMEOUT);
>  
>  	if (timed_out)
>  		rc = -ETIMEDOUT;
> @@ -382,6 +391,60 @@ static int plpks_confirm_object_flushed(struct label *label,
>  	return rc;
>  }
>  
> +int plpks_signed_update_var(struct plpks_var var, u64 flags)
> +{

I don't see a reason why var is passed by value here? A pointer would be
more typical.

cheers
