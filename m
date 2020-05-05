Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B751C5EC0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 19:26:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Gmq53T4NzDqfj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 03:26:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=WOCKK9qm; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=WOCKK9qm; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Gmk615SdzDqMT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 03:22:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588699319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLBNUm/fluAXkFzdIYicKdp0CV+hI9Whe6Z74OvWRXA=;
 b=WOCKK9qmAGW/W4kNPJifS6UNnAdyf/8ruDXkpiSDUXTI6gSlgE78zW6SAngdQvE7eguELz
 cHdIl7Hzxd6k6XO/TvXP7znXxa034cV660rLiqOJvNvCU+RIvA5i1SZo9gkjx+CcY9WZlt
 nxxkkylpPT9htV70byFQ+RbUBMg6FWo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588699319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLBNUm/fluAXkFzdIYicKdp0CV+hI9Whe6Z74OvWRXA=;
 b=WOCKK9qmAGW/W4kNPJifS6UNnAdyf/8ruDXkpiSDUXTI6gSlgE78zW6SAngdQvE7eguELz
 cHdIl7Hzxd6k6XO/TvXP7znXxa034cV660rLiqOJvNvCU+RIvA5i1SZo9gkjx+CcY9WZlt
 nxxkkylpPT9htV70byFQ+RbUBMg6FWo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-75LO88n5NC-wj0kTWeNNMA-1; Tue, 05 May 2020 13:21:57 -0400
X-MC-Unique: 75LO88n5NC-wj0kTWeNNMA-1
Received: by mail-wm1-f71.google.com with SMTP id q5so1364391wmc.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 10:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NLBNUm/fluAXkFzdIYicKdp0CV+hI9Whe6Z74OvWRXA=;
 b=e9ZTO9FM4fGSLLR7y2YTL6YzBOVTa8smpNu3GswAFdPZUPaujHYqNuCeR1xfevflgu
 9CHhX692CWGQJ6jx4d4PD9R7ykzOPfvGZNtkV15Y6NH7T/PxbhOHHwY65h7MvhT9leLR
 cyJNSF8VICbv327kv1rpPy4jDVBDHyBgmsKdVU2689Y/69mOxa6PqMLIXL6kl6VNzGdN
 LhKf7gGRRZX7gkMO0nwB1vCSxzc9pNP65mQn+UKFx7JTZHUG4hwfwkStfqRDi3qAgg59
 Lia6u80e5/RxFq1GcWqe66z46ur2ds3nO6WPqFhZ4+Ow/4Kf4xs/bHj56ejfUyNepnV7
 SNWQ==
X-Gm-Message-State: AGi0PuYT6GhOOJH5NCnhAnpIvHSUJlQ2r1tQRqcVgQf9pZcrANXYOpRy
 43A9JqOzvILsnLQJezTivdAeN6gyJT9pYh6Ymr4Rh0xxgO66Lert3LS2hLmEHioM4gp7UvXU6+S
 825VrvxXPq3ZVB690fVLyG9qFRA==
X-Received: by 2002:adf:dfcf:: with SMTP id q15mr4600162wrn.137.1588699316440; 
 Tue, 05 May 2020 10:21:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypIVV+df8r3YAEgu8Bx29AN2Dhx6gB2SP3zMh8KI8zL75cn1CSbSYF73IUInRaU7M6AlZnT4Aw==
X-Received: by 2002:adf:dfcf:: with SMTP id q15mr4600142wrn.137.1588699316221; 
 Tue, 05 May 2020 10:21:56 -0700 (PDT)
Received: from [192.168.178.58] ([151.20.132.175])
 by smtp.gmail.com with ESMTPSA id q17sm4693287wmj.45.2020.05.05.10.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2020 10:21:55 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] Statsfs: a new ram-based file sytem for Linux
 kernel statistics
To: David Rientjes <rientjes@google.com>
References: <20200504110344.17560-1-eesposit@redhat.com>
 <alpine.DEB.2.22.394.2005041429210.224786@chino.kir.corp.google.com>
 <f2654143-b8e5-5a1f-8bd0-0cb0df2cd638@redhat.com>
 <CALMp9eQYcLr_REzDC1kWTHX4SJWt7x+Zd1KwNvS1YGd5TVM1xA@mail.gmail.com>
 <1d12f846-bf89-7b0a-5c71-e61d83b1a36f@redhat.com>
 <alpine.DEB.2.22.394.2005051003380.216575@chino.kir.corp.google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6cfdf81f-caef-2489-0906-25915d9d58ff@redhat.com>
Date: Tue, 5 May 2020 19:21:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2005051003380.216575@chino.kir.corp.google.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 linux-s390@vger.kernel.org, kvm list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, kvm-ppc@vger.kernel.org,
 Jonathan Adams <jwadams@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/05/20 19:07, David Rientjes wrote:
>> I am totally in favor of having a binary format, but it should be
>> introduced as a separate series on top of this one---and preferably by
>> someone who has already put some thought into the problem (which
>> Emanuele and I have not, beyond ensuring that the statsfs concept and
>> API is flexible enough).
>>
> The concern is that once this series is merged then /sys/kernel/stats 
> could be considered an ABI and there would be a reasonable expectation 
> that it will remain stable, in so far as the stats that userspace is 
> interested in are stable and not obsoleted.
> 
> So is this a suggestion that the binary format becomes complementary to 
> statsfs and provide a means for getting all stats from a single subsystem, 
> or that this series gets converted to such a format before it is merged?

The binary format should be complementary.  The ASCII format should
indeed be considered stable even though individual statistics would come
and go.  It may make sense to allow disabling ASCII files via mount
and/or Kconfig options; but either way, the binary format can and should
be added on top.

I have not put any thought into what the binary format would look like
and what its features would be.  For example these are but the first
questions that come to mind:

* would it be possible to read/clear an arbitrary statistic with
pread/pwrite, or do you have to read all of them?

* if userspace wants to read the schema just once and then read the
statistics many times, how is it informed of schema changes?

* and of course the details of how the schema (names of stat and
subsources) is encoded and what details it should include about the
values (e.g. type or just signedness).

Another possibility is to query stats via BPF.  This could be a third
way to access the stats, or it could be alternative to a binary format.

Paolo

