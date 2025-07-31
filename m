Return-Path: <linuxppc-dev+bounces-10486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5FDB1736A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 16:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btBpP59Hrz2yLB;
	Fri,  1 Aug 2025 00:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753973437;
	cv=none; b=K9z5E6rBAHF/Zmdtq1SBkPZuc2eGCTFE4t01+TdoboerdRKyVD+cifZqqmrBZd+xtTTpUERUCqOjN2cqiQAHaGXaAK97SAlrbJ8e0lhU/+qrzLBJwe4luOYge/JcU4fXNSYgTtx5cTydYmnPUqDIqPV1rAq4KAbJmNA8Wh2Jwjb0iSd7akXDotZ5rnNP3KGOgaPSo2w/T+hp7L/iD9oRYWZf6rDUkBdNEzV6hb6XNmtb0Wvk4kDxtliVH2JIws8JQWhipemFI+m3quXNAE1VP/e9yV51l1wSQLInyOZGzosAIOJQsza68l+ZtKMIrVbUSITDomYObgLl7lhzYnGtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753973437; c=relaxed/relaxed;
	bh=najB1DUtRW0BoWTJbMks7BTjn/WaIWdbcTteMDxw7WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bQxfmNEOIAdWuZS4Y3ikHYZ0JpVR7mxZqjp/QBzUVjK35/24ia+2/AuSX7lKqhWkluT138HmrlEJHykO+24DZJStiGx2D/PcErqVqEb/KqdE1zLd/PheieLwMCsDwRyKtuS2oxy4zN45yzITB9Tn55VzQGbVIsNJHEDkMA/h8MjPlP579uwz8uce7jGsv1KYWt+vpBVChV2R116c9lOTAPuhZk8NqpAYAAz4K05wuFPJKG0SST+A67zApGwdvlLkyPv4FYOxIuy9zz/iB1erL5OWwfhVJ5lrBOEtBQmgXxq+ZOsKwe6RTQcLtjlK8RkMVdPTnBz8u+5LCvvpMHyvaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btBpP0KXvz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 00:50:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4btBTZ5DWGz9v2F;
	Thu, 31 Jul 2025 16:36:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WZlP0oQyI-4P; Thu, 31 Jul 2025 16:36:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4btBTT42bZz9tt4;
	Thu, 31 Jul 2025 16:35:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 85BCB8B76E;
	Thu, 31 Jul 2025 16:35:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id V6oOUUz4ZD7m; Thu, 31 Jul 2025 16:35:57 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 19FCF8B763;
	Thu, 31 Jul 2025 16:35:57 +0200 (CEST)
Message-ID: <97ec2636-915a-498c-903b-d66957420d21@csgroup.eu>
Date: Thu, 31 Jul 2025 16:35:56 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/33] tty: vt: use _IO() to define ioctl numbers
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, gregkh@linuxfoundation.org,
 Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20250611100319.186924-1-jirislaby@kernel.org>
 <20250611100319.186924-8-jirislaby@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250611100319.186924-8-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Jiri,

Le 11/06/2025 à 12:02, Jiri Slaby (SUSE) a écrit :
> _IO*() is the proper way of defining ioctl numbers. All these vt numbers
> were synthetically built up the same way the _IO() macro does.
> 
> So instead of implicit hex numbers, use _IO() properly.
> 
> To not change the pre-existing numbers, use only _IO() (and not _IOR()
> or _IOW()). The latter would change the numbers indeed.

On powerpc your assumption is wrong, because _IOC_NONE is not 0:

$ git grep _IOC_NONE arch/powerpc/
arch/powerpc/include/uapi/asm/ioctl.h:#define _IOC_NONE 1U

Therefore the value changes even with _IO(), leading to failure of Xorg 
as reported by Christian.

Christophe

> 
> Objdump of vt_ioctl.o reveals no difference with this patch.
> 
> Again, VT_GETCONSIZECSRPOS already uses _IOR(), so everything is paved
> for this patch.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Nicolas Pitre <nico@fluxnic.net>
> ---
>   include/uapi/linux/vt.h | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/include/uapi/linux/vt.h b/include/uapi/linux/vt.h
> index 714483d68c69..b60fcdfb2746 100644
> --- a/include/uapi/linux/vt.h
> +++ b/include/uapi/linux/vt.h
> @@ -14,9 +14,9 @@
>   		/* Note: the ioctl VT_GETSTATE does not work for
>   		   consoles 16 and higher (since it returns a short) */
>   
> -/* 0x56 is 'V', to avoid collision with termios and kd */
> +/* 'V' to avoid collision with termios and kd */
>   
> -#define VT_OPENQRY	0x5600	/* find available vt */
> +#define VT_OPENQRY		_IO('V', 0x00)	/* find available vt */
>   
>   struct vt_mode {
>   	__u8 mode;		/* vt mode */
> @@ -25,8 +25,8 @@ struct vt_mode {
>   	__s16 acqsig;		/* signal to raise on acquisition */
>   	__s16 frsig;		/* unused (set to 0) */
>   };
> -#define VT_GETMODE	0x5601	/* get mode of active vt */
> -#define VT_SETMODE	0x5602	/* set mode of active vt */
> +#define VT_GETMODE		_IO('V', 0x01)	/* get mode of active vt */
> +#define VT_SETMODE		_IO('V', 0x02)	/* set mode of active vt */
>   #define		VT_AUTO		0x00	/* auto vt switching */
>   #define		VT_PROCESS	0x01	/* process controls switching */
>   #define		VT_ACKACQ	0x02	/* acknowledge switch */
> @@ -36,21 +36,21 @@ struct vt_stat {
>   	__u16 v_signal;	/* signal to send */
>   	__u16 v_state;		/* vt bitmask */
>   };
> -#define VT_GETSTATE	0x5603	/* get global vt state info */
> -#define VT_SENDSIG	0x5604	/* signal to send to bitmask of vts */
> +#define VT_GETSTATE		_IO('V', 0x03)	/* get global vt state info */
> +#define VT_SENDSIG		_IO('V', 0x04)	/* signal to send to bitmask of vts */
>   
> -#define VT_RELDISP	0x5605	/* release display */
> +#define VT_RELDISP		_IO('V', 0x05)	/* release display */
>   
> -#define VT_ACTIVATE	0x5606	/* make vt active */
> -#define VT_WAITACTIVE	0x5607	/* wait for vt active */
> -#define VT_DISALLOCATE	0x5608  /* free memory associated to vt */
> +#define VT_ACTIVATE		_IO('V', 0x06)	/* make vt active */
> +#define VT_WAITACTIVE		_IO('V', 0x07)	/* wait for vt active */
> +#define VT_DISALLOCATE		_IO('V', 0x08)  /* free memory associated to vt */
>   
>   struct vt_sizes {
>   	__u16 v_rows;		/* number of rows */
>   	__u16 v_cols;		/* number of columns */
>   	__u16 v_scrollsize;	/* number of lines of scrollback */
>   };
> -#define VT_RESIZE	0x5609	/* set kernel's idea of screensize */
> +#define VT_RESIZE		_IO('V', 0x09)	/* set kernel's idea of screensize */
>   
>   struct vt_consize {
>   	__u16 v_rows;	/* number of rows */
> @@ -60,10 +60,10 @@ struct vt_consize {
>   	__u16 v_vcol;	/* number of pixel columns on screen */
>   	__u16 v_ccol;	/* number of pixel columns per character */
>   };
> -#define VT_RESIZEX      0x560A  /* set kernel's idea of screensize + more */
> -#define VT_LOCKSWITCH   0x560B  /* disallow vt switching */
> -#define VT_UNLOCKSWITCH 0x560C  /* allow vt switching */
> -#define VT_GETHIFONTMASK 0x560D  /* return hi font mask */
> +#define VT_RESIZEX		_IO('V', 0x0A)  /* set kernel's idea of screensize + more */
> +#define VT_LOCKSWITCH		_IO('V', 0x0B)  /* disallow vt switching */
> +#define VT_UNLOCKSWITCH		_IO('V', 0x0C)  /* allow vt switching */
> +#define VT_GETHIFONTMASK	_IO('V', 0x0D)  /* return hi font mask */
>   
>   struct vt_event {
>   	__u32 event;
> @@ -77,14 +77,14 @@ struct vt_event {
>   	__u32 pad[4];		/* Padding for expansion */
>   };
>   
> -#define VT_WAITEVENT	0x560E	/* Wait for an event */
> +#define VT_WAITEVENT		_IO('V', 0x0E)	/* Wait for an event */
>   
>   struct vt_setactivate {
>   	__u32 console;
>   	struct vt_mode mode;
>   };
>   
> -#define VT_SETACTIVATE	0x560F	/* Activate and set the mode of a console */
> +#define VT_SETACTIVATE		_IO('V', 0x0F)	/* Activate and set the mode of a console */
>   
>   /* get console size and cursor position */
>   struct vt_consizecsrpos {


