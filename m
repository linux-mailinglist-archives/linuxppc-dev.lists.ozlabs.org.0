Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6456E4628
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 13:15:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0Pc71Nzfz3cjY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 21:15:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i3oFxcza;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i3oFxcza;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i3oFxcza;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i3oFxcza;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0PbC5xP3z3c7l
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 21:14:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681730081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5KNRdeLRU2Xq/n1iDZzMtTXMvfraDKy7YfY/QU65aIc=;
	b=i3oFxczaEt479I0iFXaRhrqLSx9P6FifoKisSNQvp7e9tktK5cHxJxAFqtr3/GP3+qQL9I
	nFNrBUPeyJNPD5WLlgYOR+rD9soVZlgW5jRZCfGZG+xYH4q8JIoahT5ZvWoP57opaZ5sBw
	6jIV08hpzQ46euOkDOabHH0mEPAqZTI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681730081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5KNRdeLRU2Xq/n1iDZzMtTXMvfraDKy7YfY/QU65aIc=;
	b=i3oFxczaEt479I0iFXaRhrqLSx9P6FifoKisSNQvp7e9tktK5cHxJxAFqtr3/GP3+qQL9I
	nFNrBUPeyJNPD5WLlgYOR+rD9soVZlgW5jRZCfGZG+xYH4q8JIoahT5ZvWoP57opaZ5sBw
	6jIV08hpzQ46euOkDOabHH0mEPAqZTI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-DcTEP-9AMk68DG7dYy3YKA-1; Mon, 17 Apr 2023 07:14:40 -0400
X-MC-Unique: DcTEP-9AMk68DG7dYy3YKA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f080f534acso8156435e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 04:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681730079; x=1684322079;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KNRdeLRU2Xq/n1iDZzMtTXMvfraDKy7YfY/QU65aIc=;
        b=EK67KEDHzhoxgsommZjtZxdSECQb71sRorHn+XPJPESQTQc/LhN8w7IXJf8Fu0cx/6
         DHWqxFwN+M0cV9SDQIS4qSBvxDjiJWlVdrqQfvfw+UBkBHTNdkIx9T6NUjgvvlF58CIH
         7GA5t903IgPbxEremRUxtPkS7Kv5kAPghkqiq4IOZx9QPby4UGzjyxW+kVcGDv3S7Q5b
         2TGjzYpqkjwmisEWJZMStzfDTA+we/8RxZD0164+21ok4yyEPXE9O8O4+r+D6IMcXnqs
         RSo/4tDpTDlBQOOgIScKK4Ym9cDvLnobr30DcHnakNff2nlBPb5nOe4G7Dh/qTzB2CcF
         a70w==
X-Gm-Message-State: AAQBX9cwThSFC/80Sc1fg45+I9l3tXZL+qSYWcCyuNbWmwLHDbPDblga
	0GzT46BwaV0bgev0oo8iEg2DBAhln9tuuIBrDL2qctC7/kfKHIR2ZGGtHPlwUQIqQQgbCsVzrtg
	WMR1tQF27OV+vLPpfbhkhYtoBbg==
X-Received: by 2002:a5d:650c:0:b0:2f8:3225:2bc2 with SMTP id x12-20020a5d650c000000b002f832252bc2mr4681555wru.41.1681730079149;
        Mon, 17 Apr 2023 04:14:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350bNt0CQlgSAneNNoqT/xp81/MyHZrBQz3dDdnffEdIUnbPzTF+43gFytbOZ+e3kttt+3w0ALw==
X-Received: by 2002:a5d:650c:0:b0:2f8:3225:2bc2 with SMTP id x12-20020a5d650c000000b002f832252bc2mr4681519wru.41.1681730078827;
        Mon, 17 Apr 2023 04:14:38 -0700 (PDT)
Received: from ?IPV6:2003:cb:c700:fc00:db07:68a9:6af5:ecdf? (p200300cbc700fc00db0768a96af5ecdf.dip0.t-ipconnect.de. [2003:cb:c700:fc00:db07:68a9:6af5:ecdf])
        by smtp.gmail.com with ESMTPSA id v3-20020adfe4c3000000b002f459afc809sm10282660wrm.72.2023.04.17.04.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 04:14:38 -0700 (PDT)
Message-ID: <eb624430-6fb5-0349-0798-3f71c39e8768@redhat.com>
Date: Mon, 17 Apr 2023 13:14:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 6/7] mm/gup: remove vmas parameter from
 pin_user_pages()
To: Lorenzo Stoakes <lstoakes@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <cover.1681558407.git.lstoakes@gmail.com>
 <fa5487e54dfae725c84dfd7297b06567340165bd.1681558407.git.lstoakes@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <fa5487e54dfae725c84dfd7297b06567340165bd.1681558407.git.lstoakes@gmail.com>
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
Cc: Nelson Escobar <neescoba@cisco.com>, kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>, Leon Romanovsky <leon@kernel.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Jesper Dangaard Brouer <hawk@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Bernard Metzler <bmt@zurich.ibm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, io-uring@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.
 com>, Bjorn Topel <bjorn@kernel.org>, Jonathan Lemon <jonathan.lemon@gmail.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, Christian Benvenuti <benve@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15.04.23 14:09, Lorenzo Stoakes wrote:
> After the introduction of FOLL_SAME_FILE we no longer require vmas for any
> invocation of pin_user_pages(), so eliminate this parameter from the
> function and all callers.
> 
> This clears the way to removing the vmas parameter from GUP altogether.
> 
> Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
> ---

Ideally, we'd avoid FOLL_SAME_FILE as well

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

