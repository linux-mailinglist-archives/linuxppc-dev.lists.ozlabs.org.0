Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B975682E9A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 15:01:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5mtL2FWnz3dvW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 01:01:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hNBqq1Va;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hNBqq1Va;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hNBqq1Va;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hNBqq1Va;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5msK10blz3bT1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 01:00:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675173614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sW7aiMox0CriK8aU+HN+jb3vaXSIy6HBnrk2aPiMthI=;
	b=hNBqq1VaLUmj3Gv1bRG7q+5EQCO429IY7U/08wZlnbsDbr814ZlRjHZ0QxfnaGFtdWzpni
	tDLuxG8mKUlU8g0iKrrkVJslJvv5Pg/tJEf+A+xr1EDIPxSAPiLpbQV/Nn1IDqcMMhscrK
	f3/M7EcB/tK+JCmXdbEaboSZ0rFgfhs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675173614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sW7aiMox0CriK8aU+HN+jb3vaXSIy6HBnrk2aPiMthI=;
	b=hNBqq1VaLUmj3Gv1bRG7q+5EQCO429IY7U/08wZlnbsDbr814ZlRjHZ0QxfnaGFtdWzpni
	tDLuxG8mKUlU8g0iKrrkVJslJvv5Pg/tJEf+A+xr1EDIPxSAPiLpbQV/Nn1IDqcMMhscrK
	f3/M7EcB/tK+JCmXdbEaboSZ0rFgfhs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-vrJct8GGNnCGfJZ42pofyA-1; Tue, 31 Jan 2023 09:00:13 -0500
X-MC-Unique: vrJct8GGNnCGfJZ42pofyA-1
Received: by mail-wr1-f71.google.com with SMTP id j25-20020adfd219000000b002bfd1484f9bso1937820wrh.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 06:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sW7aiMox0CriK8aU+HN+jb3vaXSIy6HBnrk2aPiMthI=;
        b=jEeAvvFainMHQ3e42fA3h/Ch4RewiKT/OnUu7D+Km7w2n00WJrCBkUmbMf84tEBeNW
         4xtkJZwdOHM9rCe1qx4WgE5uppXmrRUOAOGMhm6Zj75+EQAed71m3WDE6t/m1hZRLKpa
         +c2XBlsydz+taD73pWhLfA972IkLovz9nBZiiF19OipN+28lHT9lDVFAcx3wazaEhovM
         4/UN6vygmahWASCGwOPZEpbtCzV1XEbnQXWZvAMkdla9joXfN2frDy2ox8lWrwq5ICVU
         1PvVFCL/d0uuST+zr6jfQKpnxc7hLhylYctWoh0gYXBTkgPnw1widTiCrdOJMdJxgoJt
         7ngg==
X-Gm-Message-State: AO0yUKVkrOq7F8ZwdqiBee/8CXHW7WzL7rTHjyRugphLJqTHpdAC3A9/
	5/Y5mI7rUxheWV42JZlL+sJ9VXpyupLKlytKXhahlP3rvAf1cL71KbwfI6c+p02QEwiXSuE7/Tm
	lFOHQJ+Nd2iSn11FvsAi1r5j6SA==
X-Received: by 2002:a05:600c:3b84:b0:3dc:1031:14c4 with SMTP id n4-20020a05600c3b8400b003dc103114c4mr3752218wms.14.1675173611361;
        Tue, 31 Jan 2023 06:00:11 -0800 (PST)
X-Google-Smtp-Source: AK7set94yYHCQtMUhLwwFZW2Tw85+OPCk5GgL8jU/FYp0b92bP94albwy2k0jgp6h4ZElMMLuWMq1g==
X-Received: by 2002:a05:600c:3b84:b0:3dc:1031:14c4 with SMTP id n4-20020a05600c3b8400b003dc103114c4mr3752186wms.14.1675173611028;
        Tue, 31 Jan 2023 06:00:11 -0800 (PST)
Received: from ?IPV6:2003:d8:2f0a:ca00:f74f:2017:1617:3ec3? (p200300d82f0aca00f74f201716173ec3.dip0.t-ipconnect.de. [2003:d8:2f0a:ca00:f74f:2017:1617:3ec3])
        by smtp.gmail.com with ESMTPSA id e38-20020a05600c4ba600b003dc434900e1sm11512963wmp.34.2023.01.31.06.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 06:00:10 -0800 (PST)
Message-ID: <658eda9c-d716-fcb7-ba0c-b36f646195f1@redhat.com>
Date: Tue, 31 Jan 2023 15:00:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 01/19] mm: Introduce vm_account
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 cgroups@vger.kernel.org
References: <cover.f52b9eb2792bccb8a9ecd6bc95055705cfe2ae03.1674538665.git-series.apopple@nvidia.com>
 <748338ffe4c42d86669923159fe0426808ecb04d.1674538665.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <748338ffe4c42d86669923159fe0426808ecb04d.1674538665.git-series.apopple@nvidia.com>
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
Cc: linux-kselftest@vger.kernel.org, rds-devel@oss.oracle.com, daniel@ffwll.ch, kvm@vger.kernel.org, linux-rdma@vger.kernel.org, jhubbard@nvidia.com, linux-fpga@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, mkoutny@suse.com, jgg@nvidia.com, hannes@cmpxchg.org, bpf@vger.kernel.org, surenb@google.com, tjmercier@google.com, io-uring@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24.01.23 06:42, Alistair Popple wrote:
> Kernel drivers that pin pages should account these pages against
> either user->locked_vm or mm->pinned_vm and fail the pinning if
> RLIMIT_MEMLOCK is exceeded and CAP_IPC_LOCK isn't held.
> 
> Currently drivers open-code this accounting and use various methods to
> update the atomic variables and check against the limits leading to
> various bugs and inconsistencies. To fix this introduce a standard
> interface for charging pinned and locked memory. As this involves
> taking references on kernel objects such as mm_struct or user_struct
> we introduce a new vm_account struct to hold these references. Several
> helper functions are then introduced to grab references and check
> limits.
> 
> As the way these limits are charged and enforced is visible to
> userspace we need to be careful not to break existing applications by
> charging to different counters. As a result the vm_account functions
> support accounting to different counters as required.
> 
> A future change will extend this to also account against a cgroup for
> pinned pages.

The term "vm_account" is misleading, no? VM_ACCOUNT is for accounting 
towards the commit limit ....

-- 
Thanks,

David / dhildenb

