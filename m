Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 451AF77C67F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 05:53:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=apekYgD9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPy6D6zyKz3cPC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 13:53:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=apekYgD9;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPy5L6Y8Lz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 13:52:22 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RPy5H3Cwrz4wxy; Tue, 15 Aug 2023 13:52:19 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692071539;
	bh=WipNlHOpHfl2S9cGwbe9j74qSCdK+cUZfrf7SFk1wb4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=apekYgD9k+drgI4RI/aemoBomLvy1KqqUkRpN/1xd3wRfeaxaSin9q0NwqB8s7O/K
	 rzkoXWx+x3jk0gXCD5V1Z8SgBXjxzRc8hGts/UXSJzCLkHJVGSKI3ho6jEr+M6vCTV
	 P+zvFJUynb3zmjekbpy0xX+dCRWhG91zLN4Wc5M9n2PoSTbS8Zhr6OgqMz7kkigolR
	 F6UT+LTcBlA4nD/nPXGIPvY4pdCUUOBF8ArZcbWLz174FBZ0EonzNPo9Lx88ySQk+T
	 AFkL/FdF+Q/KVYBoibTkcQaPuHt96kOJYVANVuwLodSuySp333NY92E14p6CLxbbA3
	 +C/6DeoqZiaIQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RPy5H2P5Hz4wxn;
	Tue, 15 Aug 2023 13:52:19 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>, linuxppc-dev
 <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v8 1/2] powerpc/rtas: Rename rtas_error_rc to
 rtas_generic_errno
In-Reply-To: <169138864808.65607.6576358707894823512.stgit@jupiter>
References: <169138864808.65607.6576358707894823512.stgit@jupiter>
Date: Tue, 15 Aug 2023 13:52:14 +1000
Message-ID: <877cpxdksx.fsf@mail.lhotse>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci <linux-pci@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
> rtas_generic_errno() function will convert the generic rtas return codes
> into errno.

I don't see the point of renaming it, it just creates unnecessary churn.
The existing name seems OK to me.

...

> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> index 3abe15ac79db1..5572a0a2f6e18 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -202,7 +202,9 @@ typedef struct {
>  #define RTAS_USER_REGION_SIZE (64 * 1024)
>  
>  /* RTAS return status codes */
> -#define RTAS_BUSY		-2    /* RTAS Busy */
> +#define RTAS_HARDWARE_ERROR	(-1)  /* Hardware Error */
> +#define RTAS_BUSY		(-2)  /* RTAS Busy */

Are the brackets necessary?

> +#define RTAS_INVALID_PARAMETER	(-3)  /* Invalid indicator/domain/sensor etc. */
>  #define RTAS_EXTENDED_DELAY_MIN	9900
>  #define RTAS_EXTENDED_DELAY_MAX	9905
>  
> @@ -212,6 +214,11 @@ typedef struct {
>  #define RTAS_THREADS_ACTIVE     -9005 /* Multiple processor threads active */
>  #define RTAS_OUTSTANDING_COPROC -9006 /* Outstanding coprocessor operations */
>  
> +/* statuses specific to get-sensor-state */
> +#define RTAS_SLOT_UNISOLATED		(-9000)
> +#define RTAS_SLOT_NOT_UNISOLATED	(-9001)
> +#define RTAS_SLOT_NOT_USABLE		(-9002)

These aren't specific to get-sensor-state.

They're used by at least: ibm,manage-flash-image, ibm,activate-firmware,
ibm,configure-connector, set-indicator etc.

They have different meanings for those calls. I think you're best to
just leave the constant values in rtas_error_rc().

>  /* RTAS event classes */
>  #define RTAS_INTERNAL_ERROR		0x80000000 /* set bit 0 */
>  #define RTAS_EPOW_WARNING		0x40000000 /* set bit 1 */
> @@ -425,6 +432,7 @@ extern int rtas_set_indicator(int indicator, int index, int new_value);
>  extern int rtas_set_indicator_fast(int indicator, int index, int new_value);
>  extern void rtas_progress(char *s, unsigned short hex);
>  int rtas_ibm_suspend_me(int *fw_status);
> +int rtas_generic_errno(int rtas_rc);
>  
>  struct rtc_time;
>  extern time64_t rtas_get_boot_time(void);
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index c087eeee320ff..80b6099e8ce20 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1330,33 +1330,34 @@ bool __ref rtas_busy_delay(int status)
>  }
>  EXPORT_SYMBOL_GPL(rtas_busy_delay);
>  
> -static int rtas_error_rc(int rtas_rc)
> +int rtas_generic_errno(int rtas_rc)
>  {
>  	int rc;
>  
>  	switch (rtas_rc) {
> -		case -1: 		/* Hardware Error */
> -			rc = -EIO;
> -			break;
> -		case -3:		/* Bad indicator/domain/etc */
> -			rc = -EINVAL;
> -			break;
> -		case -9000:		/* Isolation error */
> -			rc = -EFAULT;
> -			break;
> -		case -9001:		/* Outstanding TCE/PTE */
> -			rc = -EEXIST;
> -			break;
> -		case -9002:		/* No usable slot */
> -			rc = -ENODEV;
> -			break;
> -		default:
> -			pr_err("%s: unexpected error %d\n", __func__, rtas_rc);
> -			rc = -ERANGE;
> -			break;
> +	case RTAS_HARDWARE_ERROR:	/* Hardware Error */
> +		rc = -EIO;
> +		break;
> +	case RTAS_INVALID_PARAMETER:	/* Bad indicator/domain/etc */
> +		rc = -EINVAL;
> +		break;
> +	case RTAS_SLOT_UNISOLATED:	/* Isolation error */
> +		rc = -EFAULT;
> +		break;
> +	case RTAS_SLOT_NOT_UNISOLATED:	/* Outstanding TCE/PTE */
> +		rc = -EEXIST;
> +		break;
> +	case RTAS_SLOT_NOT_USABLE:	/* No usable slot */
> +		rc = -ENODEV;
> +		break;
> +	default:
> +		pr_err("%s: unexpected error %d\n", __func__, rtas_rc);
> +		rc = -ERANGE;
> +		break;
>  	}
>  	return rc;
>  }
> +EXPORT_SYMBOL(rtas_generic_errno);
  
Should be GPL.

cheers
