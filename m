Return-Path: <linuxppc-dev+bounces-905-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCFB969426
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 08:51:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wybql4snmz2yLB;
	Tue,  3 Sep 2024 16:50:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725346259;
	cv=none; b=WgebitN9VJzrxXl4kMvcjfd+70m319DmpmnX4lWz40WXgqcSlH3C2YrcpKYOIsum9kmFF/kQWzwPKZMfALj277e9lDfVpu5dLR3PFOEFTuORAqdxmhLVLlbJVBmZFJWzuUsIgdJRdnJtc5hbHK4KuXa3+pWusDaj5W6QJ19eZ0Vn9QjvKskpNAIjM/LDD/VXZlubW9Npl1e1e28a1SWcSa69VeTHpB5ItlIbf1F0NO1ykGDCpdylz0q5fZKT+mzIleQUGDfCeIomYFgDIgRkfhC/DfMpSxcU/+2k4txjjpmk8G1oGSs+S8XefYreyYTSLcGqTu9h9ALiWPZ5rGuoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725346259; c=relaxed/relaxed;
	bh=CQh0HwbwudB1Ww2VJkCueArmMI0AZXpCTMdiFdJKXpI=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type; b=ZBVlLCOTZW0QXlWH/emoG7mald/XWEOdq+w5PBCa06DDUxNGkeTcj6Fk3q7P+Pv5hkO9Yb9LNjFxZZ5ycuwigqtzqKnwbxwVs9ONuWGQJPvWxb+4jW0J4J4BRGZI3xtOD4OXS39ek65+pwnaNsfhK7w/aHyuY1DCUNMJPNIBYtf3wB8apvEGs5VDQvCgp4UGt3yu6ipG8PSaXFW+5Bkpbq0YecZ8MSIysvzjCF5AkjhO1YCihNJzrksK6pz8qgmveRm4B43A/u711GSYXlpHIkOMjF2tXrLV8ZhBqeTDOXOBjo6OWqLKAHj+70CsbbT7z/dnJhbEQxp9KUPbKXChXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TJkkp3Er; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TJkkp3Er;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wybql4dksz2yL5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 16:50:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725346259;
	bh=CQh0HwbwudB1Ww2VJkCueArmMI0AZXpCTMdiFdJKXpI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TJkkp3ErSASQvhmMaTnHtityUB+krmJD4Y3zwvw6vlTumSrwmJStye9dB1DwAPiRO
	 xcdsxaYqL7NAnSy0J7S565BeSD17qUpIFYfb0o83u+kXV/FGFvDZ3VL1FD3sxCbuHm
	 Vs0hY/tI/8Iu0z92RQH64V156VoHgCkOOiK5Jpo4l+TvolJ26gL9yA0mL7KUOkFc26
	 oeUaQjbd0lsBh+7y1JmjFfFK3bovuuL4kZ2uRAeSBYOuGmnVJy/nv0VnSd2Hl7H3Lz
	 kEvjRiVx5UHmnqbu0Svdei7SvKBdhVf0HXjsV6G7u0746zt1QQ/3vnqmG80RI4N/Z/
	 oY6CKnKhr6exQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wybql3cL7z4w2F;
	Tue,  3 Sep 2024 16:50:59 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Chen Ni <nichen@iscas.ac.cn>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Chen Ni <nichen@iscas.ac.cn>
Subject: Re: [PATCH] tty: hvc: convert comma to semicolon
In-Reply-To: <20240903023001.491055-1-nichen@iscas.ac.cn>
References: <20240903023001.491055-1-nichen@iscas.ac.cn>
Date: Tue, 03 Sep 2024 16:50:58 +1000
Message-ID: <87y1495iy5.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Chen Ni <nichen@iscas.ac.cn> writes:
> Replace a comma between expression statements by a semicolon.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/tty/hvc/hvsi_lib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/drivers/tty/hvc/hvsi_lib.c b/drivers/tty/hvc/hvsi_lib.c
> index 22e1bc4d8a66..b35c44caf3d7 100644
> --- a/drivers/tty/hvc/hvsi_lib.c
> +++ b/drivers/tty/hvc/hvsi_lib.c
> @@ -303,7 +303,7 @@ int hvsilib_write_mctrl(struct hvsi_priv *pv, int dtr)
>  	pr_devel("HVSI@%x: %s DTR...\n", pv->termno,
>  		 dtr ? "Setting" : "Clearing");
>  
> -	ctrl.hdr.type = VS_CONTROL_PACKET_HEADER,
> +	ctrl.hdr.type = VS_CONTROL_PACKET_HEADER;
>  	ctrl.hdr.len = sizeof(struct hvsi_control);
>  	ctrl.verb = cpu_to_be16(VSV_SET_MODEM_CTL);
>  	ctrl.mask = cpu_to_be32(HVSI_TSDTR);
> -- 
> 2.25.1

