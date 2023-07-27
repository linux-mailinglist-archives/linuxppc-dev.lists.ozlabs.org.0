Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2EC76521B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 13:18:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FKKJ1yCs;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FKKJ1yCs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBSv42PBdz3cNN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 21:18:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FKKJ1yCs;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FKKJ1yCs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBSt94hgHz3cJ4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 21:17:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690456668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=joTIkPI209sObt2TiAmgvJZNWubEOBjzxcWIZzxaGo0=;
	b=FKKJ1yCsjRYG9xSibyF8oP6qp7qmyimAqr3y7ePURoAZgMp+43aXhjFsWEB7U7DeJdBZBN
	sZjx1898N3sEA2GuAYTQT8WI0nVB8YWvMFOx1rLS8jc2QRbB7uCzauyqUp9EG0RVCiRQaf
	fxK0xaQL5yB7fh6pE7n2KPzDBN8iTGg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690456668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=joTIkPI209sObt2TiAmgvJZNWubEOBjzxcWIZzxaGo0=;
	b=FKKJ1yCsjRYG9xSibyF8oP6qp7qmyimAqr3y7ePURoAZgMp+43aXhjFsWEB7U7DeJdBZBN
	sZjx1898N3sEA2GuAYTQT8WI0nVB8YWvMFOx1rLS8jc2QRbB7uCzauyqUp9EG0RVCiRQaf
	fxK0xaQL5yB7fh6pE7n2KPzDBN8iTGg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-Whe6IfZdPvKjDWHhbSOx1A-1; Thu, 27 Jul 2023 07:17:46 -0400
X-MC-Unique: Whe6IfZdPvKjDWHhbSOx1A-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3fbffd088a9so4875495e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 04:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690456666; x=1691061466;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=joTIkPI209sObt2TiAmgvJZNWubEOBjzxcWIZzxaGo0=;
        b=Ag2BGzTUFW01CBKkEc9sNpLx44mv7IODmnaolPcIpLGhKwMFSsS7bnRrYTydHpQWrP
         7TO9L3612nRPN3xahdu+lh4Wpo4zcCWH4hEcFpR0JqHgyPE9wz+shB/6UxklXlAWb4qG
         UJNu2jZxinEDRDx47npd7EFKK4b9ptCBNrsyBD8VcSmDF2wllIwWSCitfkSh8qnrj0y0
         3Be/opb7DAtq+rtc/D7DvUoNg7tOoEHZzoZHRdVzvzC3vewRBdQo+zv+8DvXuH0l3nkN
         68zXQMG1j46DAzx/iMybxHKpXWDGV1GfCiHDnfE9Iu5Ps1O/wiCkxyHnuFJJB56Ia+Gu
         6Peg==
X-Gm-Message-State: ABy/qLaE+P+gRF892k68zJEQJ28Dqlso39E3uM8bdJAH6v+my46O5jdb
	NrOSMzBxrqndNwVRxGY/xDEfGIKizCffX8xkAncv0Iu5rdNsX6NxqtJvwVOX1F5DI704c3neY6H
	XexMZ/NenGfiR9poqymrFqhzznQ==
X-Received: by 2002:a7b:cd15:0:b0:3fb:e1d5:7f48 with SMTP id f21-20020a7bcd15000000b003fbe1d57f48mr1402318wmj.5.1690456665785;
        Thu, 27 Jul 2023 04:17:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEY5DqEGXXJW18qdo/6Ci5D9mGeSpbBJjJ6RB4X9iml5q95jsP91Fq+Tv53BM9RaPEt2tTOmQ==
X-Received: by 2002:a7b:cd15:0:b0:3fb:e1d5:7f48 with SMTP id f21-20020a7bcd15000000b003fbe1d57f48mr1402304wmj.5.1690456665395;
        Thu, 27 Jul 2023 04:17:45 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id p1-20020a7bcc81000000b003fa96fe2bebsm1558089wma.41.2023.07.27.04.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 04:17:44 -0700 (PDT)
Message-ID: <4d6a1911-e2e2-a230-eb48-37bf0df9bbb0@redhat.com>
Date: Thu, 27 Jul 2023 13:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 6/7] mm/memory_hotplug: Embed vmem_altmap details in
 memory block
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230727080232.667439-1-aneesh.kumar@linux.ibm.com>
 <20230727080232.667439-7-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230727080232.667439-7-aneesh.kumar@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> +	/*
> +	 * Now that we are tracking alloc and free correctly
> +	 * we can add check to verify altmap free pages.
> +	 */

Better remove the history lesson from the comment.

"Verify that all vmemmap pages have actually been freed."

> +	if (altmap) {
> +		WARN(altmap->alloc, "Altmap not fully unmapped");
> +		kfree(altmap);
> +	}
> +
>   	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
>   		memblock_phys_free(start, size);
>   		memblock_remove(start, size);

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

