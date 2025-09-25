Return-Path: <linuxppc-dev+bounces-12572-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D83BBB9E23A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Sep 2025 10:54:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXSFS3tRzz2ytg;
	Thu, 25 Sep 2025 18:54:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758790460;
	cv=none; b=iqKXOKDwX2Yl4NFfYJhFMYOL97R2LHhB83AG7U2CRR2UMJNAhRKq2iLrUeAvDbs/IhnJ/P1/UJv9IXZt9lVvqu7DQZIXg7I58bKQqogc1AywmmnHFGr8ayFIaiG9BBenm+ivY7lovQYCbP/b0zjilUrgMEM8PnsbIealq1Hm/6/y1W5CtZcW95AYnrvKKj9QHwN/G8z82ZAburPuTFOL8+D3hQ1ud9YPyY/GepSRgM/JKT9eslDVrh2RPwcVhDV4L8DbA5/3CnWvhovQiPBt+z4KN0EKEZSO5bFNwo1EG0dkpLsWnv60KJ9h64gGzsp0wMpEvynexU1fCjboO2ZsdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758790460; c=relaxed/relaxed;
	bh=1gsFn/xU4RBQz6XkcOaHJDRKfU+vBnP2TcZFpNfy7DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyRTymuikVTm9WwZJvAjp52AdwymwNHigKHxx1RAX4xlfLBcts3CZEgglDDZhnS+rEDcNrxAhbYwL9iHUkDw3/6FeHUdJi+AVVNSKzNpxT9kaE6Y9KqxA/GQFl/uOXZ7Z4ii7MSdmCbfYMJl78zfsFvULodztxGIdEdBKQ6sQl//Sh7RLqaQfaZ13uzXCDp9O/39YbctpWGpoxxMpy6jIlcwJKpFaTnxjCdVoMa7zI5JrkLPUEVl7c120INXjBieKxHUPN8OoDmTClYzGyVIM9vZ3QiL56s4V8vOw/b/fnfKSFK19qBMxWO6bn5aGZ2Vc+yAupF16sLZ1On0H1chGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L8qNXfFe; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TwuvTB9/; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L8qNXfFe;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TwuvTB9/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXSFR1gYLz2yqR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 18:54:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758790453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1gsFn/xU4RBQz6XkcOaHJDRKfU+vBnP2TcZFpNfy7DE=;
	b=L8qNXfFeEOLppvPNn/xJwOZgG6U2A0lkFx6BbcTlQv4/pH/bQtK+PXeLxTmMRywrzzv19c
	dXI3TTAtDCVtQv9FIT6CBWw3t3Tur/IoCWXnts342L5TqD3EQPtYihOkdCEoGqnWkgnBFu
	NHHg8p0tNNZO4v/UOtACCI6LY4WAoNw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758790454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1gsFn/xU4RBQz6XkcOaHJDRKfU+vBnP2TcZFpNfy7DE=;
	b=TwuvTB9/KMbEwDsCE0u9OSLrRYSGKMXVKg0bLeAMSrRzYSbGEnabr6nEs9EiefT+gM/Q9d
	mtxqwlD2zCyji6q1JVsUp5OcYT3KlcXEmZyoB+HbcWaToa2jaulvLIKcDXH7J6Y9VivUFv
	kF4qhgKOvuiS2TgbZ45u0TCffNZKFWU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-az9eYR8iOb2OdFYadYCvUw-1; Thu, 25 Sep 2025 04:54:11 -0400
X-MC-Unique: az9eYR8iOb2OdFYadYCvUw-1
X-Mimecast-MFC-AGG-ID: az9eYR8iOb2OdFYadYCvUw_1758790450
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45f2a1660fcso5991055e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 01:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790450; x=1759395250;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gsFn/xU4RBQz6XkcOaHJDRKfU+vBnP2TcZFpNfy7DE=;
        b=cMMUoK9sXkAgtvIuZQR5h9LbW00ESkbWQuOycTGCanRn6tupijRaxHNGZ6BxNLdsY6
         hL83gFZmtKduzuTp20uQT9pbm9t8QesbKqystVaSe5Jx6bBsovRJufj7k1qRHdphrLyN
         83WJH/CS0+rT9ossxagtk7ld9XQ2MO8hjlYM0yYyHGLlOjQMOLmbHuGHpqsUiWLx4yFB
         PDb5+CxJEoBYK0fjyVsW+zEifgR9qMuJQxYvycENTZ/vv9ybUKVw5k9auGTqZpQV4Gw7
         K0Ku0q8+5EJ5DsfvrzSfnAFkLMOJt5Rr4cU9lTB2wRrvF/pUn/m93vKNjUnUw+svXc51
         uKhw==
X-Forwarded-Encrypted: i=1; AJvYcCUDystrRQwBU6pLigGEavTGtmqgLu0ORScbRyI0CxeAJTqzcMhyGt2LJ9r2CNDI7t9x5mCCrVpPj6Sh3ss=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz0oA5I1pAoJveLcVP5m4zbMc53Qi/9xwd5RQpo6UviuZBUVOqL
	+nzv6+REAp30FJw6DVfagsP7aYCv5I9XKTc7eM8U8jQfPbSE+A+SBzhCJydUBuZllhmrIXiulZf
	ALUNZdhrQHfnTRgI70VkNXPmwRAjBpS+8mHG6WqPNTrGd5Lyn7PR8oAgl/xGbTivVuDY=
X-Gm-Gg: ASbGncsKnCHH07zkcMJiES34EvlcS3S9bOy3jGZ6v/J9xJ7u0x8mxlEY0jc11pOTeia
	Ohxs1EtQO9gINKkjZwoVpnbUiU2msGXcOOHYbrnytD9oR4QoTPyEzAXnhfD6LmQFATiWljey977
	JK36o5UnMncc7Ixgt/fteHPWYNoKaCd14mKrAd1G3kr5mpt+XyZyaKRPqOtXZ2r/QV+x5dJmZE5
	KOcyMmXdMoi6E//6VCYlC8kie/Oepo54SmpRrEbhpsDpD6jwjun9Lsl+cH8TkyJbXP9L3bVvMkH
	7zOQRQ/33YRT3cHXeTCqK+R2J6RHXrbTJ3ZakuZQBxdYYnVS0Dt5n2SROyByGpQZ71Yl2he3sld
	DR1JBrD1w9+KBND+2bEFBfEkOEbvKq1HUj7NR8lg2d180HLkv2ZVm+kNVbUHma1V3IPlD
X-Received: by 2002:a05:600c:45d4:b0:45f:2ed1:d1c5 with SMTP id 5b1f17b1804b1-46e32a26e4emr26084955e9.36.1758790450340;
        Thu, 25 Sep 2025 01:54:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7WIypjZMXxbyn5a/1aTfXoe6g5qRkRehIOgpqrXFKvpJdmOeQruAy+DajB3CSz8qmflRRXg==
X-Received: by 2002:a05:600c:45d4:b0:45f:2ed1:d1c5 with SMTP id 5b1f17b1804b1-46e32a26e4emr26084605e9.36.1758790449876;
        Thu, 25 Sep 2025 01:54:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:f800:c101:5c9f:3bc9:3d08? (p200300d82f3ff800c1015c9f3bc93d08.dip0.t-ipconnect.de. [2003:d8:2f3f:f800:c101:5c9f:3bc9:3d08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb1a3sm2096184f8f.10.2025.09.25.01.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:54:09 -0700 (PDT)
Message-ID: <0de65980-4333-434a-ae7d-2b7be46c2cca@redhat.com>
Date: Thu, 25 Sep 2025 10:54:07 +0200
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
Subject: Re: [PATCH 1/2] drivers/base/node: merge register_one_node() and
 register_node() to a single function.
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
 Aboorva Devarajan <aboorvad@linux.ibm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>
References: <cover.1758736423.git.donettom@linux.ibm.com>
 <40257b5228dec05e5b252f02438608eb8d681a2d.1758736423.git.donettom@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <40257b5228dec05e5b252f02438608eb8d681a2d.1758736423.git.donettom@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MtQr454mwBZrDCtlm-Cvdq61-K8migBTMnygFE15C9c_1758790450
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24.09.25 20:40, Donet Tom wrote:
> register_one_node() and register_node() are small functions.
> This patch merges them into a single function named register_node()
> to improve code readability.
> 
> No functional changes are introduced.
> 
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---

[...]

>   /**
>    * unregister_node - unregister a node device
>    * @node: node going away
> @@ -869,7 +842,13 @@ void register_memory_blocks_under_node_hotplug(int nid, unsigned long start_pfn,
>   }
>   #endif /* CONFIG_MEMORY_HOTPLUG */
>   
> -int register_one_node(int nid)
> +/*

We can directly convert this to proper kernel doc by using /**

> + * register_node - Setup a sysfs device for a node.
> + * @nid - Node number to use when creating the device.
> + *
> + * Initialize and register the node device.

and briefly describing what the return value means

"Returns 0 on success, ..."

> + */
> +int register_node(int nid)
>   {
>   	int error;
>   	int cpu;
> @@ -880,14 +859,23 @@ int register_one_node(int nid)
>   		return -ENOMEM;
>   
>   	INIT_LIST_HEAD(&node->access_list);
> -	node_devices[nid] = node;
>   
> -	error = register_node(node_devices[nid], nid);
> +	node->dev.id = nid;
> +	node->dev.bus = &node_subsys;
> +	node->dev.release = node_device_release;
> +	node->dev.groups = node_dev_groups;
> +
> +	error = device_register(&node->dev);
>   	if (error) {
> -		node_devices[nid] = NULL;

Wondering why we did have this temporary setting of the node_devices[] 
in there. But I cannot immediately spot why it was required.

-- 
Cheers

David / dhildenb


