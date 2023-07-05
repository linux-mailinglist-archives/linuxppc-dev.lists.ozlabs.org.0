Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05853747AD9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 03:07:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OSsYZoFE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwhNM6h9hz3bVG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 11:07:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OSsYZoFE;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwhMR1wplz301R
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 11:06:59 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4QwhMM3H3Qz4wZJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 11:06:55 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4QwhMM34kdz4wxW; Wed,  5 Jul 2023 11:06:55 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OSsYZoFE;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=jniethe5@gmail.com; receiver=ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4QwhMM1fPmz4wZJ
	for <linuxppc-dev@ozlabs.org>; Wed,  5 Jul 2023 11:06:53 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-55b0e7efb1cso2963922a12.1
        for <linuxppc-dev@ozlabs.org>; Tue, 04 Jul 2023 18:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688519211; x=1691111211;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6B06GS4iy8TqUk7hY8NtAitoKkrQhlR6zk1yw8ILGRc=;
        b=OSsYZoFEOtMkoqacm+f4BmEd1RwcPB4rFv/5JHb2Gn4rqfk8jpDI6yTkhLjybf6m1r
         NOufVzQg7/qbro98QLvLuxzpZQx7R4N6J+ViVRKQRGVNqLr2WOn9lE9ro7m4pCEjgYio
         ULA1HNOnKne3dJocSGAf4FQNtu7k40JLBGO+7bwLZUj2ubbzPSV72kCgRMwNVtO1KoRy
         HStzTAAZSpSBYScGO9rji4UPZwqjfQ/W+RzwkB4tvTIiCMM+nQhiJ6DA/U0AowJ9g52P
         ScdUh4IOb6qdUmOSmiWDxv9xktrTQz863+SSVwvV0HSm2hILtUFzDRqqPmbdCXvaEuKG
         c8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688519211; x=1691111211;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6B06GS4iy8TqUk7hY8NtAitoKkrQhlR6zk1yw8ILGRc=;
        b=HVcXyE+LAcNIO21z4sbeRToiCRc90o4fGrFTy9SHNeDMTNARC0s3GgsfSaY8IhI/Qa
         M6WhKCPbCKxkYzRHdiKTjXDaNiEy0JEM5OerBXcD+ff0Cyql7UsSJdhzyMuBYHOpTTsi
         yf3tb6B7AhEZojB8wRgubNkQmle7GLLL5SmmMDF/TrhQM+h5bwcOSaA2ubFzZKt7RZSZ
         TsKt8BOR6MaTb4uWJYiT0niUlJ1wcWgQws/zf4O5lWpkf/0eXCPsqMixNqH+6ArxIl9h
         TdJU835ot5biAjcLp3MrJNtAML6gFTl/vbVkUB3rUwFG5Z81tP2+kcPL9izKe2R4RuPG
         PKCA==
X-Gm-Message-State: ABy/qLa6pIzFlJoZhSWmHlvUFBVDWHSbU3N19/KEFkihbzFejgYIOui/
	Qglx/roX6zs3V20v1GLXsdcuwNQ05QmlaA==
X-Google-Smtp-Source: APBJJlHdUpyH8VKRNGeP0jYvktZ1NuMv4BGlbGnh5ttmtaisrAeG9vMXfXXtFmskzNXgOJVFZeO8NQ==
X-Received: by 2002:a05:6a20:4327:b0:12e:6e0f:535 with SMTP id h39-20020a056a20432700b0012e6e0f0535mr9086787pzk.34.1688519211069;
        Tue, 04 Jul 2023 18:06:51 -0700 (PDT)
Received: from localhost-live.default (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.gmail.com with ESMTPSA id n15-20020a170902e54f00b001b88178b1b7sm6518731plf.34.2023.07.04.18.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 18:06:50 -0700 (PDT)
Subject: Re: [PATCH] powernv/opal-prd: Silence memcpy() run-time false
 positive warnings
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
References: <168776304370.89193.185568680784294524.stgit@jupiter>
From: Jordan Niethe <jniethe5@gmail.com>
Message-ID: <72357055-fc0a-38ba-8c45-cdb07b284fbf@gmail.com>
Date: Wed, 5 Jul 2023 11:06:46 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <168776304370.89193.185568680784294524.stgit@jupiter>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 26/6/23 5:04 pm, Mahesh Salgaonkar wrote:
> opal_prd_msg_notifier extracts the opal prd message size from the message
> header and uses it for allocating opal_prd_msg_queue_item that includes
> the correct message size to be copied. However, while running under
> CONFIG_FORTIFY_SOURCE=y, it triggers following run-time warning:
> 
> [ 6458.234352] memcpy: detected field-spanning write (size 32) of single field "&item->msg" at arch/powerpc/platforms/powernv/opal-prd.c:355 (size 4)
> [ 6458.234390] WARNING: CPU: 9 PID: 660 at arch/powerpc/platforms/powernv/opal-prd.c:355 opal_prd_msg_notifier+0x174/0x188 [opal_prd]
> [...]
> [ 6458.234709] NIP [c00800000e0c0e6c] opal_prd_msg_notifier+0x174/0x188 [opal_prd]
> [ 6458.234723] LR [c00800000e0c0e68] opal_prd_msg_notifier+0x170/0x188 [opal_prd]
> [ 6458.234736] Call Trace:
> [ 6458.234742] [c0000002acb23c10] [c00800000e0c0e68] opal_prd_msg_notifier+0x170/0x188 [opal_prd] (unreliable)
> [ 6458.234759] [c0000002acb23ca0] [c00000000019ccc0] notifier_call_chain+0xc0/0x1b0
> [ 6458.234774] [c0000002acb23d00] [c00000000019ceac] atomic_notifier_call_chain+0x2c/0x40
> [ 6458.234788] [c0000002acb23d20] [c0000000000d69b4] opal_message_notify+0xf4/0x2c0
> [...]
> 
> Add a flexible array member to avoid false positive run-time warning.
> 
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> ---
>   arch/powerpc/platforms/powernv/opal-prd.c |    7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
> index 113bdb151f687..9e2c4775f75f5 100644
> --- a/arch/powerpc/platforms/powernv/opal-prd.c
> +++ b/arch/powerpc/platforms/powernv/opal-prd.c
> @@ -30,7 +30,10 @@
>    */
>   struct opal_prd_msg_queue_item {
>   	struct list_head		list;
> -	struct opal_prd_msg_header	msg;
> +	union {
> +		struct opal_prd_msg_header	msg;
> +		DECLARE_FLEX_ARRAY(__u8, msg_flex);
> +	};
>   };
>   
>   static struct device_node *prd_node;
> @@ -352,7 +355,7 @@ static int opal_prd_msg_notifier(struct notifier_block *nb,
>   	if (!item)
>   		return -ENOMEM;
>   
> -	memcpy(&item->msg, msg->params, msg_size);
> +	memcpy(&item->msg_flex, msg->params, msg_size);

This does silence the warning but it seems like we might be able to go a 
little further.

What about not adding that flex array to struct opal_prd_msg_queue_item, 
but adding one to struct opal_prd_msg. That is what the data format 
actually is.

So we'd have something like:


     struct opal_prd_msg  {

         struct opal_prd_msg_header hdr;

         char msg[];

     }


and change things to use that instead?

But that might be more trouble than it is worth, alternatively we can 
just do:

	item->msg = *hdr;
	memcpy((char *)item->msg + sizeof(*hdr), (char *)hdr + sizeof(*hdr), 
msg_size - sizeof(*hdr));


>   
>   	spin_lock_irqsave(&opal_prd_msg_queue_lock, flags);
>   	list_add_tail(&item->list, &opal_prd_msg_queue);
> 
> 
> 
> 
