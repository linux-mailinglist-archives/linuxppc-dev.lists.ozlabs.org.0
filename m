Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 517F41C5E4B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 19:05:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GmLV2yB3zDqh2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 03:05:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=NJLcWqQ/; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJLcWqQ/; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GmHr70pZzDqdl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 03:02:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588698164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wA5G//ZMwKX3KXqf3Mv3pq9KAcUMr/otngiqdWE/rQ=;
 b=NJLcWqQ/ENsJ+t/3EMR2cv3LsBUlkNLVwpvutzqVm4ORyHPIAovPrCTSn0NGWIN2Ps+hwi
 broxYvjq1ehjZ3YwoE02Judx+oGHQcp5IvlK/nU6Jl7v4lWD/3CvEieK/a/1I/aCGJ48hA
 rKc8MDPlbHGAao66K74N/t2zGfmMpQs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588698164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wA5G//ZMwKX3KXqf3Mv3pq9KAcUMr/otngiqdWE/rQ=;
 b=NJLcWqQ/ENsJ+t/3EMR2cv3LsBUlkNLVwpvutzqVm4ORyHPIAovPrCTSn0NGWIN2Ps+hwi
 broxYvjq1ehjZ3YwoE02Judx+oGHQcp5IvlK/nU6Jl7v4lWD/3CvEieK/a/1I/aCGJ48hA
 rKc8MDPlbHGAao66K74N/t2zGfmMpQs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-W0fzic0hOiaP-CDSjjP90A-1; Tue, 05 May 2020 13:02:42 -0400
X-MC-Unique: W0fzic0hOiaP-CDSjjP90A-1
Received: by mail-wm1-f71.google.com with SMTP id n127so1159437wme.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 10:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5wA5G//ZMwKX3KXqf3Mv3pq9KAcUMr/otngiqdWE/rQ=;
 b=dnfqFEm+KQibVUdQmO7w3RpKtBiyrI7Kr7mUgo6bzfq+P6uoUIEess+LnF0hsPF1Ft
 XdzQP0IQOcMrWugJ8FLkmE0bTqHZwTO4VZmaiPo7cFSYPaolz/yf/cpKCIL19+5s/+h5
 kInRATJBJ93NLlBOGI2gqR1gZlSq1Vg6xdoPI9ft8jGQ8J62ZYSnOTiH8Tws+W1JHuxp
 9pnupqREyeyxKBDKFPobVVo4eWgHiiH418/zjsp9oSR4PdPPF1awmUrhTphpICfuNLh7
 8IsPIFpfKTSvdXTUbE5qWQ8h3AetWFa9ILj9Jz8ugOsCeVZzQl6gPU0vQgIDOE/Qx18b
 NqlA==
X-Gm-Message-State: AGi0Pua4H0cpEDm+2iM98LBwa9GSM6TxEdd4Q2wiINwazawgfCFRokfG
 YvgtBBIQp7W38B+Zl2WRVXZxdihI6eBbG8Rg/8lK/Ur16ZLlllD1UGY0ED3RBSZj24/PrMj3m1W
 UKuYtDX+RNt13O5Zg/ME+BsHZZg==
X-Received: by 2002:adf:d0c5:: with SMTP id z5mr5096761wrh.410.1588698156860; 
 Tue, 05 May 2020 10:02:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypJLNwomNOVHwIvpSDnSwZmv6Omr127dtUlNqUvacYqezIg5AT62IcLqVfdIy2Hep5WWyqsAoA==
X-Received: by 2002:adf:d0c5:: with SMTP id z5mr5096701wrh.410.1588698156541; 
 Tue, 05 May 2020 10:02:36 -0700 (PDT)
Received: from [192.168.178.58] ([151.20.132.175])
 by smtp.gmail.com with ESMTPSA id g24sm1632241wrb.35.2020.05.05.10.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2020 10:02:35 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] Statsfs: a new ram-based file sytem for Linux
 kernel statistics
To: Jim Mattson <jmattson@google.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20200504110344.17560-1-eesposit@redhat.com>
 <alpine.DEB.2.22.394.2005041429210.224786@chino.kir.corp.google.com>
 <f2654143-b8e5-5a1f-8bd0-0cb0df2cd638@redhat.com>
 <CALMp9eQYcLr_REzDC1kWTHX4SJWt7x+Zd1KwNvS1YGd5TVM1xA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1d12f846-bf89-7b0a-5c71-e61d83b1a36f@redhat.com>
Date: Tue, 5 May 2020 19:02:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CALMp9eQYcLr_REzDC1kWTHX4SJWt7x+Zd1KwNvS1YGd5TVM1xA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: linux-s390@vger.kernel.org, kvm list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, kvm-ppc@vger.kernel.org,
 Jonathan Adams <jwadams@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Rientjes <rientjes@google.com>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/05/20 18:53, Jim Mattson wrote:
>>> Since this is becoming a generic API (good!!), maybe we can discuss
>>> possible ways to optimize gathering of stats in mass?
>> Sure, the idea of a binary format was considered from the beginning in
>> [1], and it can be done either together with the current filesystem, or
>> as a replacement via different mount options.
> 
> ASCII stats are not scalable. A binary format is definitely the way to go.

I am totally in favor of having a binary format, but it should be
introduced as a separate series on top of this one---and preferably by
someone who has already put some thought into the problem (which
Emanuele and I have not, beyond ensuring that the statsfs concept and
API is flexible enough).

ASCII stats are necessary for quick userspace consumption and for
backwards compatibility with KVM debugfs (which is not an ABI, but it's
damn useful and should not be dropped without providing something as
handy), so this is what this series starts from.

Paolo

