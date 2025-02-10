Return-Path: <linuxppc-dev+bounces-6049-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1229BA2F770
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 19:41:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsD1r5Sz5z30TP;
	Tue, 11 Feb 2025 05:41:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739212896;
	cv=none; b=RzxGHjXVIRBzJwq7a2N6y8R0sK0GyiSNmj0zkLzqOfpDYnYmDRFbBlnRMpiGPzdc5gKNshfa/2PnwvNj5MrYSmC6xEG1lpotnKmXKkQQdFY92UbwQ8Qb4EVJUjaR2ifRtpstI6d9lzg2357zQsqEsz67zBNSzplHq7JDcpjiB5JqztYN820NK3bI0cx5Kihf7KpQHdnteWbLsUPM6LYfdOdO4Jrx6m1HIeWfrQnhs5bcv+JuOwuoqXLRMCDlieOdu8TomDwCq8fCY6WZgXzTMyg5mjKbdI/zkls0SbjgeYBwrasF28D+SnagItvBTgE28GLRkYkzlG2NBjziC9/DfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739212896; c=relaxed/relaxed;
	bh=y5Y8uzPh19Vq/79ybTl3j5BilFyRa3IBZXW8XJ411wM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SL9EdmmIz4AtFxFx6zys2vJWYZPvCUbx6Oftbbwk87l5+vZud3m2ujQn0FbukCbDVypaQMZXgNJa8GECvYbDzZbC2Tv5tHu/3mYh+1jynYzXSEhEjL8bbxf88Oe6icdQQWpBYZrO56JBTvWKH8sgfyh/FY02ZqkTZS3OPnz+2zuThDAoTooAv/0/QjjvxuIF4cPek5+nKrMNEuvGf4Juenvrh7543wMMfJZKIffKcyxyHvDk3956BcwBuSAXuQDjI3jcIbX2B1CzbTbACXah3ncEF8Aitiv2ECJMWKdFR9ATxSLSBIy+65cmniCPFrIIKj8UBN23GaIeCwGCp3/MPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CZh4WWDD; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CZh4WWDD; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CZh4WWDD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CZh4WWDD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsD1q6K9tz3054
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 05:41:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739212893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y5Y8uzPh19Vq/79ybTl3j5BilFyRa3IBZXW8XJ411wM=;
	b=CZh4WWDDuQXu5RG4YFJr6NKOPmBfinLXe7+V8oJDUsYQwX860m5TBQHj8tM+QlpUbKb1iE
	WNwdbRcYc7c/Huk9FBQfItnkdx2pVyaJYWq0TSVSzBPUvyus+v8ieM8KZUVbe6oGDAB+Of
	yLx5xKY0LRlvsUAtpMU0GBlqBsBBd/o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739212893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y5Y8uzPh19Vq/79ybTl3j5BilFyRa3IBZXW8XJ411wM=;
	b=CZh4WWDDuQXu5RG4YFJr6NKOPmBfinLXe7+V8oJDUsYQwX860m5TBQHj8tM+QlpUbKb1iE
	WNwdbRcYc7c/Huk9FBQfItnkdx2pVyaJYWq0TSVSzBPUvyus+v8ieM8KZUVbe6oGDAB+Of
	yLx5xKY0LRlvsUAtpMU0GBlqBsBBd/o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-44lIMLb6PgyAEFh77MkfkA-1; Mon, 10 Feb 2025 13:41:31 -0500
X-MC-Unique: 44lIMLb6PgyAEFh77MkfkA-1
X-Mimecast-MFC-AGG-ID: 44lIMLb6PgyAEFh77MkfkA
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38dcd8ddc5eso2180369f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 10:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212890; x=1739817690;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y5Y8uzPh19Vq/79ybTl3j5BilFyRa3IBZXW8XJ411wM=;
        b=c/qkSoDDc6mN5fX+zwlBmNY0ICyx4XRZNmIS2DQTAKw+rJuJrN3fkFJPULEF3oklIX
         KFXq140EJyy9BoAf79bXoV7oLsfljZzqLa0r33H8s6N5pm0UAEjeNvGYFNMqkg9zymxi
         DWZB8DYH2faH5K3EbCqXH0qXtpTEh0EZDjJ8dnqptZpuEuaVPXQhQwxg0Uz73ce/diqs
         qQMhheRZsUha36xPZvEyHmoQZuomIxdLEu+lgeYeZMU5nDidffzDvUhZKlJv+vMqVXH9
         b7v6T/LcOWcpZOWrgge3Mlp+MGiHPghuBNHcZpj/3MTGlzpQPkuEXmlGTPqOP0p0Zgyg
         TGOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpy6K0dproKVN/KVdPQ1MKVdKoZYwu9P1TYHl3VzYjfqZb0SQkEP0bfbgF+pGLyiDXgY879QP4jGaiBpc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwMmL4lgT/eOak4ioNkaY5NfvUVQMcz0J0a+P72aLjH8/GNUOjH
	Ded8M8Y2d7/LSLFvu04gyThWp30zOhGmr+934a7NPsD1tAfXZCXFioP1tjzI24vWovNAg6GKB9s
	AO0DLIPEY15dqf/fazGuQOjn88VVdOPfGgquhMc+4Zr7BVjhIrlqBOEzjlBUDAhE=
X-Gm-Gg: ASbGncv6PgF1JWjF9Sd5zzfOxRkhndfDB3lgloMmB5f36N5QbChgucJIaBlQDrkiQXz
	oCxgHuMbdUmAHLJwL1mmBDWDC+8NOL12pytSMMAGpVm2Uzcrr0npXNYPp0lPsWWwBybT2XDhJ/G
	6HtEUxxoHlyx0Nm1qE9Dw4gRsTDHUiIcCpKcWdlyi2SiZy2YrckBEv+2mZfUaLNZy2D4rrAT7+b
	1KQWMo4irlx0Awmc602lwfH8w9NDRQ05e7vFHCiFf75xZAUHwOUcLOvdb0xDiq5hT5WgjGiMqsg
	jOQkcv5RSMCNcab3rClAf1y9zU91KIcxO9dhvXoBB+8sPdfkfXeGnxIolu6dpgAnfMLPIpD4OR/
	lPz8SwJjB4uG3WFJb/8HDPLQPp3YXaQBH
X-Received: by 2002:adf:f552:0:b0:38d:ba09:86b5 with SMTP id ffacd0b85a97d-38dc935fd30mr8356793f8f.52.1739212890433;
        Mon, 10 Feb 2025 10:41:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjt5GOWnPQL8qWJWzWicp05/2CzwbVpqP4Iexee9A79WecGjReB/qxF3GuYmscVUvKpxlGrQ==
X-Received: by 2002:adf:f552:0:b0:38d:ba09:86b5 with SMTP id ffacd0b85a97d-38dc935fd30mr8356754f8f.52.1739212890044;
        Mon, 10 Feb 2025 10:41:30 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:b800:12c4:65cd:348a:aee6? (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd34f2af5sm7815443f8f.78.2025.02.10.10.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:41:28 -0800 (PST)
Message-ID: <cca05a6f-fbfe-43c9-815b-eadbdcd7050b@redhat.com>
Date: Mon, 10 Feb 2025 19:41:26 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/20] rmap: Add support for PUD sized mappings to rmap
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: Alison Schofield <alison.schofield@intel.com>, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
 <1518b89f5659d2595bf9878da4a76221ffcfef60.1738709036.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1518b89f5659d2595bf9878da4a76221ffcfef60.1738709036.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EsMmSysD23oZpnNkpsTi3FIt3y4LVbuisAl4oYDGz74_1739212890
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 04.02.25 23:48, Alistair Popple wrote:
> The rmap doesn't currently support adding a PUD mapping of a
> folio. This patch adds support for entire PUD mappings of folios,
> primarily to allow for more standard refcounting of device DAX
> folios. Currently DAX is the only user of this and it doesn't require
> support for partially mapped PUD-sized folios so we don't support for
> that for now.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>

Nit: patch subject should start with "mm/rmap:"

-- 
Cheers,

David / dhildenb


