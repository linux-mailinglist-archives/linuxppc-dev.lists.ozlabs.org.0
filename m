Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FF175FB38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 17:53:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y0MRRmij;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y0MRRmij;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8l7c1W7vz30N8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 01:53:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y0MRRmij;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y0MRRmij;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8l6l27p4z2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 01:52:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690213963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23DfRIR5QEmobWx5A5IINKoqO5KQK9NZR/EXIdMN3SQ=;
	b=Y0MRRmijofjInsAN5whq6bfXvhyjNeIXSI3igSgtatjufhCQeqbOa55+MBub1Yyd0f1LgT
	c22PEbuzGPgWSR17Mjjh+H+3O6sLjRejAdIUBCaR9A6Xwp29XnhPUlBYvMxaPWwW+0OE5J
	4UcpdvPDVGJ1vJA6R27HpGq8LpSvenI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690213963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23DfRIR5QEmobWx5A5IINKoqO5KQK9NZR/EXIdMN3SQ=;
	b=Y0MRRmijofjInsAN5whq6bfXvhyjNeIXSI3igSgtatjufhCQeqbOa55+MBub1Yyd0f1LgT
	c22PEbuzGPgWSR17Mjjh+H+3O6sLjRejAdIUBCaR9A6Xwp29XnhPUlBYvMxaPWwW+0OE5J
	4UcpdvPDVGJ1vJA6R27HpGq8LpSvenI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-3iCZvvEHMJiI-RZSlyOUtw-1; Mon, 24 Jul 2023 11:52:41 -0400
X-MC-Unique: 3iCZvvEHMJiI-RZSlyOUtw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-31421c900b7so2703416f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 08:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690213960; x=1690818760;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23DfRIR5QEmobWx5A5IINKoqO5KQK9NZR/EXIdMN3SQ=;
        b=flpa+zYBObv4767sclDNBRT37gS7XgRt7GeOf+gLW48DXeXZcJqKf9PZC0JSzdBGFI
         Z86IV+xLBJhj/NRx1LwTLIrOG84aUJgvBrYa1sDF8A7SKud262OnSYXhE/7SpiIjfWI2
         NL/fbhtn5uhQK7Msllx8WL6twVZxCnpuM1M9RjNqnRXb+EdtA7NgN2zLQYGi1yHIOD5e
         TQFSV4diQKDhwQHzwCR1UFsgZw3MpI1MNy4YeyUDJrRSkKSVzYtiMreoq81lza7Ucgzz
         hWOon9fQA7DF0FtepF6mwb830jXLxbwrhhEvzLG0HEmOuce2zAzP685akgMz77Ou6U9x
         5KwA==
X-Gm-Message-State: ABy/qLYaY//LlY7dxIDCTQASzFlwNhU3LD3SkD/6gbbbfYgbUZZFoGWL
	9eOKwJyrZxbEunUCua1PIV6HJGbR44dw827381C8MgzDlgPibBeRd2sfipWGIyFRxDsystFh2fP
	w28lD4xDqjY9WAPQnIOBXTxmY0g==
X-Received: by 2002:adf:df89:0:b0:314:10c1:881d with SMTP id z9-20020adfdf89000000b0031410c1881dmr7867453wrl.68.1690213960766;
        Mon, 24 Jul 2023 08:52:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGvNlSrbtUadtnaU8R8nG66+qRqgvB8WhcithN8FYPh4cr1l0kcFA+eq/ISdpANVwVjUzXMng==
X-Received: by 2002:adf:df89:0:b0:314:10c1:881d with SMTP id z9-20020adfdf89000000b0031410c1881dmr7867438wrl.68.1690213960422;
        Mon, 24 Jul 2023 08:52:40 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77? (p200300cbc73dbb0091a50d1c3a7e4c77.dip0.t-ipconnect.de. [2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77])
        by smtp.gmail.com with ESMTPSA id r9-20020adff709000000b002fb60c7995esm13580880wrp.8.2023.07.24.08.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 08:52:39 -0700 (PDT)
Message-ID: <141e1000-0c2c-093f-01ea-cd2947fe00e2@redhat.com>
Date: Mon, 24 Jul 2023 17:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 5/6] powerpc/book3s64/memhotplug: Enable memmap on
 memory for radix
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230718024409.95742-1-aneesh.kumar@linux.ibm.com>
 <20230718024409.95742-6-aneesh.kumar@linux.ibm.com>
 <7d3a0d68-1d65-a34a-c6c7-80234face7ce@redhat.com>
 <abd47d75-092f-ba61-d865-168cbf65c842@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <abd47d75-092f-ba61-d865-168cbf65c842@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

>>> +            mhp_altmap.base_pfn = PHYS_PFN(start);
>>> +            mhp_altmap.free = PHYS_PFN(size) - nr_vmemmap_pages;
>>
>>
>> That change does not belong into this patch.
>>
> 
> 
> I kept that change with ppc64 enablement because only ppc64 arch got check against
> those values in the free path.

Let's make that accounting consistent in patch #4. I think it really 
belongs in there, especially once we clarify the "free vs. reserved" 
handling.

-- 
Cheers,

David / dhildenb

