Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FD15B0DDF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 22:13:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MND2r59tXz3bqv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 06:13:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BWlHmED/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BWlHmED/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BWlHmED/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BWlHmED/;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MND270Qmvz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 06:12:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662581547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PR8WUalLy9btDZgRxhhifmVZcWnjA5H+Lwe7MIcntxQ=;
	b=BWlHmED/+vNlTvAkKhcC25hKOTIRm0DKdqStoF4o7fpzNhXC91Vcd1JLZ+r9ixgPAjo1up
	66TEMuAiYsWn2s4DayrIA0UjW4QTCHshfD3VjBQgWtfHRkbCxbJiJOLLPud6c10/RKzb8+
	235ZCCiexvQy45NGDGxA6glXgKVFIFc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662581547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PR8WUalLy9btDZgRxhhifmVZcWnjA5H+Lwe7MIcntxQ=;
	b=BWlHmED/+vNlTvAkKhcC25hKOTIRm0DKdqStoF4o7fpzNhXC91Vcd1JLZ+r9ixgPAjo1up
	66TEMuAiYsWn2s4DayrIA0UjW4QTCHshfD3VjBQgWtfHRkbCxbJiJOLLPud6c10/RKzb8+
	235ZCCiexvQy45NGDGxA6glXgKVFIFc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-BaqMjs1NPPCdzUzbaVh5Uw-1; Wed, 07 Sep 2022 16:12:20 -0400
X-MC-Unique: BaqMjs1NPPCdzUzbaVh5Uw-1
Received: by mail-qk1-f200.google.com with SMTP id u15-20020a05620a0c4f00b006b8b3f41303so12681762qki.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Sep 2022 13:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=PR8WUalLy9btDZgRxhhifmVZcWnjA5H+Lwe7MIcntxQ=;
        b=QMJwDfJYg0ZakhNTax/cWVS2qn1q1f4iVJjBJXUSaxLv5h00ypehiSEjAead/M/ROM
         Rn/VhcxR4S8z5JWonrTw9D0n4hAkGUQpYxz9JVM2c/W48jpVi8ux1sOAgWT2Iapte0Gj
         0pWXcKmweqi6Xv9L8PLmqPs6YlpBrHSlu8ffKYrmKh+1C8MF07n82tdC3jxXmUO53c94
         o6/c3ejLyJv9RhJ3SsQxVrYAdXTWMd77WANlX5i4HffVsNQFgCGTF7psyJvV+VdjFazo
         UJ0U2S+5tpeWVFNVDRpxDVgzmEtQTHLKZLkXG2A7dPAAVRK0hxF1eTlhc4ES/EJ0HKlo
         YmWg==
X-Gm-Message-State: ACgBeo0kefBJZQBBu0GLBFgoQJqbMctylloz7y3/uKUxRbCW5A304tXI
	wlN8MrwUEbjNb2qqZdNF1veRfSL6SEePP0x87g3qy1DiL+qSp0fwDU+RtIGvkRydhih/yBUNKY4
	QzLhLmKmlGS2/tOsV3nNvPLNsfQ==
X-Received: by 2002:a37:794:0:b0:6ba:c4c6:5772 with SMTP id 142-20020a370794000000b006bac4c65772mr3899659qkh.257.1662581540288;
        Wed, 07 Sep 2022 13:12:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR73M0W+Epq5dj5LsV52688VKEeeZ/nLsno9QEVhJpOlqX9zO7Psv2NZ0/u62ChoHi1bpiJOoA==
X-Received: by 2002:a37:794:0:b0:6ba:c4c6:5772 with SMTP id 142-20020a370794000000b006bac4c65772mr3899630qkh.257.1662581539926;
        Wed, 07 Sep 2022 13:12:19 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id v2-20020a05620a0f0200b006bb0e5ca4bbsm16343485qkl.85.2022.09.07.13.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 13:12:18 -0700 (PDT)
Date: Wed, 7 Sep 2022 16:12:16 -0400
From: Peter Xu <peterx@redhat.com>
To: Yang Shi <shy828301@gmail.com>
Subject: Re: [v2 PATCH 2/2] powerpc/64s/radix: don't need to broadcast IPI
 for radix pmd collapse flush
Message-ID: <Yxj7INfcagKu1nH9@xz-m1.local>
References: <20220907180144.555485-1-shy828301@gmail.com>
 <20220907180144.555485-2-shy828301@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220907180144.555485-2-shy828301@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: david@redhat.com, jhubbard@nvidia.com, hughd@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, jgg@nvidia.com, aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 07, 2022 at 11:01:44AM -0700, Yang Shi wrote:
> The IPI broadcast is used to serialize against fast-GUP, but fast-GUP
> will move to use RCU instead of disabling local interrupts in fast-GUP.
> Using an IPI is the old-styled way of serializing against fast-GUP
> although it still works as expected now.
> 
> And fast-GUP now fixed the potential race with THP collapse by checking
> whether PMD is changed or not.  So IPI broadcast in radix pmd collapse
> flush is not necessary anymore.  But it is still needed for hash TLB.
> 
> Suggested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Yang Shi <shy828301@gmail.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

