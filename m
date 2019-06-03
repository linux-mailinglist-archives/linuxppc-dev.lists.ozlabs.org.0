Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CF033A50
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 23:54:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HpjT2r1SzDqX9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 07:54:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mgXqHJD2"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HpcK0gHrzDqZV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 07:49:36 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id f20so28871275edt.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 14:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jSb30N0jvHoftFPeqnRT0DDU5guICPUBTZ+cum9JlR4=;
 b=mgXqHJD2asQbJ2oQs51g/wKDUPSvM+cdNOzAPTyJufLHFAJ19jz11IiehaMBP9Q8ik
 U7cGojJDSlIkY3XlU1wbDp/ZvfgCPH2xtvqbe8RTcqyW4RgEYqKYfvzgUXPExUHfWphX
 l6AEhObQDHlSi21ygsz20Rc+h9b47N32S+aUh7dW5enm+vZUggpdxoXVUyuZMF5MtWwu
 HvQgRVJ2g/tV3CdwcqyDzfDmGbDOJgMVhPQtiAPMWcP+2I1nYtbVep68GhMqaZszwkMu
 ZoMyIv97BEMZtXBzKLTZmelReybdKtsgdltfFU51nMZzyYEnx+zhis0dtU/Ii/M4+PfR
 vrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=jSb30N0jvHoftFPeqnRT0DDU5guICPUBTZ+cum9JlR4=;
 b=MMPZJl3LRkN65LOhq/hFDHG9jMlUThQTvYzJmSeQ5GgbPAKLu+LIS0Z1bQNaINqF1q
 6KJBhNEQ5LOWPwSsRgzYMH6lnQX5p+IxThUJ8qsPim4bbav93WjMeBD2SQRTLdGZk0TV
 ku0mv7NNVb59OhWnKpvqjUWVvHpJNo2yphG8lHSv3PyKPo47NmUfs+QpbWbtL1GUdw6z
 MxEc1iVZ/LdlGQYsdJhpOYvDmRwHH/3zihvqqKcB8pUIzAoVMJSfRViTRHGfgdXsflrG
 KO7UdYhJxkcdjvTZd9CYEKHtMjJcPpvPV9u7eWpgcWOX1MQKzdAqslaDmhT+TjKcOKiZ
 u3OQ==
X-Gm-Message-State: APjAAAX9hopqOFdBamp79/Aj3glcLMzkuYgvmx0cQHesj886fAd8pIbN
 AAPzviGmRHmjFS1IftkoNR4=
X-Google-Smtp-Source: APXvYqy1VbSFtSybN1lKgHKlPjNOgnekacgTTpaBFyeruT/9MIRoRmfvBRLBg5v3bxan4Gxq56A6XA==
X-Received: by 2002:aa7:c645:: with SMTP id z5mr31432297edr.43.1559598573674; 
 Mon, 03 Jun 2019 14:49:33 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id d5sm1533710edr.8.2019.06.03.14.49.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 14:49:32 -0700 (PDT)
Date: Mon, 3 Jun 2019 21:49:32 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 05/11] drivers/base/memory: Pass a block_id to
 init_memory_block()
Message-ID: <20190603214932.3xsvxwiiutcve4tz@master>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-6-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-6-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Igor Mammedov <imammedo@redhat.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2019 at 01:11:46PM +0200, David Hildenbrand wrote:
>We'll rework hotplug_memory_register() shortly, so it no longer consumes
>pass a section.
>
>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>Signed-off-by: David Hildenbrand <david@redhat.com>
>---
> drivers/base/memory.c | 15 +++++++--------
> 1 file changed, 7 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>index f180427e48f4..f914fa6fe350 100644
>--- a/drivers/base/memory.c
>+++ b/drivers/base/memory.c
>@@ -651,21 +651,18 @@ int register_memory(struct memory_block *memory)
> 	return ret;
> }
> 
>-static int init_memory_block(struct memory_block **memory,
>-			     struct mem_section *section, unsigned long state)
>+static int init_memory_block(struct memory_block **memory, int block_id,
>+			     unsigned long state)
> {
> 	struct memory_block *mem;
> 	unsigned long start_pfn;
>-	int scn_nr;
> 	int ret = 0;
> 
> 	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
> 	if (!mem)
> 		return -ENOMEM;
> 
>-	scn_nr = __section_nr(section);
>-	mem->start_section_nr =
>-			base_memory_block_id(scn_nr) * sections_per_block;
>+	mem->start_section_nr = block_id * sections_per_block;
> 	mem->end_section_nr = mem->start_section_nr + sections_per_block - 1;
> 	mem->state = state;
> 	start_pfn = section_nr_to_pfn(mem->start_section_nr);
>@@ -694,7 +691,8 @@ static int add_memory_block(int base_section_nr)
> 
> 	if (section_count == 0)
> 		return 0;
>-	ret = init_memory_block(&mem, __nr_to_section(section_nr), MEM_ONLINE);
>+	ret = init_memory_block(&mem, base_memory_block_id(base_section_nr),
>+				MEM_ONLINE);

If my understanding is correct, section_nr could be removed too.

> 	if (ret)
> 		return ret;
> 	mem->section_count = section_count;
>@@ -707,6 +705,7 @@ static int add_memory_block(int base_section_nr)
>  */
> int hotplug_memory_register(int nid, struct mem_section *section)
> {
>+	int block_id = base_memory_block_id(__section_nr(section));
> 	int ret = 0;
> 	struct memory_block *mem;
> 
>@@ -717,7 +716,7 @@ int hotplug_memory_register(int nid, struct mem_section *section)
> 		mem->section_count++;
> 		put_device(&mem->dev);
> 	} else {
>-		ret = init_memory_block(&mem, section, MEM_OFFLINE);
>+		ret = init_memory_block(&mem, block_id, MEM_OFFLINE);
> 		if (ret)
> 			goto out;
> 		mem->section_count++;
>-- 
>2.20.1

-- 
Wei Yang
Help you, Help me
