Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5012498AF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 07:53:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DYcY0xQgzDrHn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 15:53:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tAv/eSUE"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DYZF2D3fzDqdn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 15:51:48 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id m3so2837423pgv.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 22:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=WVMH90dv0lwk+QmfLLUzw1QWTVNRKMvQM7jvt9Ku0R8=;
 b=tAv/eSUEQYaUbN0k5uDBzxOwqW4QbifR1TZoWL0G2I+GCq5uq05qRUpAH17zkZgKKn
 +PRoeOvhhkdRMTttCHbl2SbgPxI5KUJnq6byKxjq9oIyr+ZSQOYGEqbJA32DgyP6tjyh
 pGcaHa2I4cGPAC4hKLfLQYHMQnGwfbZqzoLLRpLYUdCZ2pG2RKY+CCF5NU/JC7LiwBxw
 U0cQgHLeMce65Zn/V7pEy6HBxok+w7ky7gZKCE30EVjXpmDX0HdeBp/1H7qS9ttFvh4C
 tAVuSgtjDjwsOPW3fyWvMmDzwtRbpwBs5oHvS9LZJiR2VB4vTmCooqRK2nxH1e6kCj53
 xMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=WVMH90dv0lwk+QmfLLUzw1QWTVNRKMvQM7jvt9Ku0R8=;
 b=kTz93NGhGkgzWsHfW8N7YCuUZo4OMPRvBfdqppFuL3YoegZGqGTSeOQB9wmhhi7ZTo
 fB/mDJLe/z4oHo8cqee5mVMrEHOmjy8bf8hMoknlY/8X2dZZ2Q7t4oVc7bJ4yUjkbXNK
 uWbG4i4z5658FTNwLywo28SHFqDxu74/KY/cPuWjFeTfwG+TICr6Pl5QwkV/ROeGTvct
 6ka5qJUzLgMUSjOTYzz/CLakeTSjk3TuTWFvKlpjQ1nk0KLSAIL+SKWKowoka6uRg+Ul
 eV7MKxmg56JjwSxNam446pxvcLdlkwSzQCp0STbUQgHn1UuolhHPexYiNjzQR94XbVdN
 9drQ==
X-Gm-Message-State: APjAAAXOxkiEUYIWVQhNRqR1Z9vx/K1t140b8dQpBJ6OQ8CgiMY7ipqb
 gWTUzwSbVSmNAagm1qcgOus=
X-Google-Smtp-Source: APXvYqyqWtU9KDSwzGFQIZ1BAJMuRObxqM0Q/HRpZ26hRbRcu8zQmAPuuiB99a1TBGbA/p7lGq9Fkg==
X-Received: by 2002:a63:5402:: with SMTP id i2mr32284276pgb.414.1566453106127; 
 Wed, 21 Aug 2019 22:51:46 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id 195sm32618164pfu.75.2019.08.21.22.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 22:51:45 -0700 (PDT)
Message-ID: <8446e4f922a140b9fcba60a37105a4090b7b1681.camel@gmail.com>
Subject: Re: [PATCH v3 1/2] powerpc/powernv: Enhance opal message read
 interface
From: Oliver O'Halloran <oohall@gmail.com>
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org
Date: Thu, 22 Aug 2019 15:51:41 +1000
In-Reply-To: <20190821081335.20103-1-hegdevasant@linux.vnet.ibm.com>
References: <20190821081335.20103-1-hegdevasant@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-08-21 at 13:43 +0530, Vasant Hegde wrote:
> Use "opal-msg-size" device tree property to allocate memory for "opal_msg".
> 
> Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
> Cc: Jeremy Kerr <jk@ozlabs.org>
> Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> ---
> Changes in v3:
>   - Call BUG_ON, if we fail to allocate memory during init.
> 
> -Vasant
> 
>  arch/powerpc/platforms/powernv/opal.c | 29 ++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
> index aba443be7daa..4f1f68f568bf 100644
> --- a/arch/powerpc/platforms/powernv/opal.c
> +++ b/arch/powerpc/platforms/powernv/opal.c
> @@ -58,6 +58,8 @@ static DEFINE_SPINLOCK(opal_write_lock);
>  static struct atomic_notifier_head opal_msg_notifier_head[OPAL_MSG_TYPE_MAX];
>  static uint32_t opal_heartbeat;
>  static struct task_struct *kopald_tsk;
> +static struct opal_msg *opal_msg;
> +static uint64_t opal_msg_size;
>  
>  void opal_configure_cores(void)
>  {
> @@ -271,14 +273,9 @@ static void opal_message_do_notify(uint32_t msg_type, void *msg)
>  static void opal_handle_message(void)
>  {
>  	s64 ret;
> -	/*
> -	 * TODO: pre-allocate a message buffer depending on opal-msg-size
> -	 * value in /proc/device-tree.
> -	 */
> -	static struct opal_msg msg;
>  	u32 type;
>  
> -	ret = opal_get_msg(__pa(&msg), sizeof(msg));
> +	ret = opal_get_msg(__pa(opal_msg), opal_msg_size);
>  	/* No opal message pending. */
>  	if (ret == OPAL_RESOURCE)
>  		return;
> @@ -290,14 +287,14 @@ static void opal_handle_message(void)
>  		return;
>  	}
>  
> -	type = be32_to_cpu(msg.msg_type);
> +	type = be32_to_cpu(opal_msg->msg_type);
>  
>  	/* Sanity check */
>  	if (type >= OPAL_MSG_TYPE_MAX) {
>  		pr_warn_once("%s: Unknown message type: %u\n", __func__, type);
>  		return;
>  	}
> -	opal_message_do_notify(type, (void *)&msg);
> +	opal_message_do_notify(type, (void *)opal_msg);
>  }
>  
>  static irqreturn_t opal_message_notify(int irq, void *data)
> @@ -306,9 +303,21 @@ static irqreturn_t opal_message_notify(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static int __init opal_message_init(void)
> +static int __init opal_message_init(struct device_node *opal_node)
>  {
>  	int ret, i, irq;

> +	const __be32 *val;
> +
> +	val = of_get_property(opal_node, "opal-msg-size", NULL);
> +	if (val)
> +		opal_msg_size = be32_to_cpup(val);

Use of_property_read_u32()

> +
> +	/* If opal-msg-size property is not available then use default size */
> +	if (!opal_msg_size)
> +		opal_msg_size = sizeof(struct opal_msg);
> +
> +	opal_msg = kmalloc(opal_msg_size, GFP_KERNEL);

> +	BUG_ON(opal_msg == NULL);

Seems questionable. Why not fall back to using a staticly allocated
struct opal_msg? Or re-try the allocation with the size limited to
sizeof(struct opal_msg)?

>  	for (i = 0; i < OPAL_MSG_TYPE_MAX; i++)
>  		ATOMIC_INIT_NOTIFIER_HEAD(&opal_msg_notifier_head[i]);
> @@ -910,7 +919,7 @@ static int __init opal_init(void)
>  	}
>  
>  	/* Initialise OPAL messaging system */
> -	opal_message_init();
> +	opal_message_init(opal_node);
>  
>  	/* Initialise OPAL asynchronous completion interface */
>  	opal_async_comp_init();

