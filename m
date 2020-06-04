Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB461EECBE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 23:02:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dJC119mTzDqbr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 07:02:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=e.emanuelegiuseppe@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vZt0DMCf; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d8wT04x0zDqfy
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 01:34:44 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id x13so6612547wrv.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jun 2020 08:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D3By0h98qnolfLM0+QRpl2dqCpgdvgnNY+OucjDnKDY=;
 b=vZt0DMCfoJUEXzeTrBICKPyqGfuBe7vx1mxfTRfe7AMZfEO9MgZiR1mPQATjGg7sos
 L2gEppsjZRToGPjruQDj6PgcZ9k1LIUGD0iWIyOtnINMSac6a+7rCj3z4QC4lrZCdKFE
 k2yM8OXoWQeV2IMPxu2sJJA6xUKeMYmYvndml0HnOewX3ksq8F1r9goi9s79mQpwsSIb
 c5mAXaNTKzUmdLKel6x7irCbEI4DTv2oXtv/qN7Oxn1zzp0W/r8QazRbJWdm+blAf/6N
 mqCzGRjWNAgSpkjxibd5bm0M9tIZAW+bPd5JKLWcPAMtTD2J+9FPsJ68L+Qr8Bw98u2/
 uiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D3By0h98qnolfLM0+QRpl2dqCpgdvgnNY+OucjDnKDY=;
 b=RUujY/CbTl3znCUeeQmYsYO+1Qj4YuIEps5jdulrXHfT+O8Mu+n1UWm3+pQXPAQ1uV
 zpmXT/5x2+idpWDYA/IDIBDbO+Yq+SQLA/LvzUR+eGnN9UgAjXIsfesZflcpmIZUqe7B
 xTsr1Q3W7qe4PHVq4C6CyhcwEN8X2AVVhghbKUAjpnm+YHWhn0RPNPHD1SWBUzOiozy6
 E/tSWWGGuygEkGQMNqTRaC64LG8SpvEZhcADNmzdPfBNSjqm3ZPMNj7wufG5q9UN///q
 i3lJ/Rf46TIScgv7ZlLk2ils49Lfc0F8J7LAeySlkNbPfQStSdqK1SPlSOVO3Jm5xpsN
 VjOQ==
X-Gm-Message-State: AOAM5316Ti29c0OJRfl7OLTuB5C+MD/V/IhlsGa9NluDh2IX09rnkAsJ
 s3JmBHsD3GCiuRld0Xek+o8=
X-Google-Smtp-Source: ABdhPJxfqtpJqbRTF++Qa4Ke2KxsNtWe0xpkNWVokflegjt7JKKLmL/tz6wJQHjKWgmRMZK5uAnt/Q==
X-Received: by 2002:adf:f0d2:: with SMTP id x18mr4926753wro.250.1591284880431; 
 Thu, 04 Jun 2020 08:34:40 -0700 (PDT)
Received: from [192.168.8.102] ([194.230.155.251])
 by smtp.gmail.com with ESMTPSA id q1sm7431317wmc.12.2020.06.04.08.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 08:34:39 -0700 (PDT)
Subject: Re: [PATCH v3 2/7] documentation for stats_fs
To: Randy Dunlap <rdunlap@infradead.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, kvm@vger.kernel.org
References: <20200526110318.69006-1-eesposit@redhat.com>
 <20200526110318.69006-3-eesposit@redhat.com>
 <c9ddaed1-0efc-650b-6a51-ad5fc431af69@infradead.org>
From: Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
Message-ID: <dcaab39e-6cd3-c6cf-1515-7067a8b0ed9f@gmail.com>
Date: Thu, 4 Jun 2020 17:34:37 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <c9ddaed1-0efc-650b-6a51-ad5fc431af69@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 05 Jun 2020 07:01:19 +1000
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
Cc: linux-s390@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Jonathan Adams <jwadams@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Rientjes <rientjes@google.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

>> +
>> +The STATS_FS_HIDDEN attribute won't affect the aggregation, it will only
>> +block the creation of the files.
> 
> Why does HIDDEN block the creation of files?  instead of their visibility?

The file itself is used to allow the user to view the content of a 
value. In order to make it hidden, the framework just doesn't create the 
file.
The structure is still present and considered in statsfs, however.

Hidden in this case means not visible at all thus not created, not the 
hidden file concept of dotted files (".filename")

> 
>> +
>> +Add values to parent and child (also here order doesn't matter)::
>> +
>> +        struct kvm *base_ptr = kmalloc(..., sizeof(struct kvm));
>> +        ...
>> +        stats_fs_source_add_values(child_source, kvm_stats, base_ptr, 0);
>> +        stats_fs_source_add_values(parent_source, kvm_stats, NULL, STATS_FS_HIDDEN);
>> +
>> +``child_source`` will be a simple value, since it has a non-NULL base
>> +pointer, while ``parent_source`` will be an aggregate. During the adding
>> +phase, also values can optionally be marked as hidden, so that the folder
>> +and other values can be still shown.
>> +
>> +Of course the same ``struct stats_fs_value`` array can be also passed with a
>> +different base pointer, to represent the same value but in another instance
>> +of the kvm struct.
>> +
>> +Search:
>> +
>> +Fetch a value from the child source, returning the value
>> +pointed by ``(uint64_t *) base_ptr + kvm_stats[0].offset``::
>> +
>> +        uint64_t ret_child, ret_parent;
>> +
>> +        stats_fs_source_get_value(child_source, &kvm_stats[0], &ret_child);
>> +
>> +Fetch an aggregate value, searching all subsources of ``parent_source`` for
>> +the specified ``struct stats_fs_value``::
>> +
>> +        stats_fs_source_get_value(parent_source, &kvm_stats[0], &ret_parent);
>> +
>> +        assert(ret_child == ret_parent); // check expected result
>> +
>> +To make it more interesting, add another child::
>> +
>> +        struct stats_fs_source child_source2 = stats_fs_source_create(0, "child2");
>> +
>> +        stats_fs_source_add_subordinate(parent_source, child_source2);
>> +        // now  the structure is parent -> child1
>> +        //                              -> child2
> 
> Is that the same as                 parent -> child1 -> child2
> ?  It could almost be read as
>                                      parent -> child1
>                                      parent -> child2

No the example in the documentation shows the relationship
parent -> child1 and
parent -> child2.
It's not the same as
parent -> child1 -> child2.
In order to do the latter, one would need to do:

stats_fs_source_add_subordinate(parent_source, child_source1);
stats_fs_source_add_subordinate(child_source1, child_source2);

Hope that this clarifies it.

> 
> Whichever it is, can you make it more explicit, please?
> 
> 
>> +
>> +        struct kvm *other_base_ptr = kmalloc(..., sizeof(struct kvm));
>> +        ...
>> +        stats_fs_source_add_values(child_source2, kvm_stats, other_base_ptr, 0);
>> +
>> +Note that other_base_ptr points to another instance of kvm, so the struct
>> +stats_fs_value is the same but the address at which they point is not.
>> +
>> +Now get the aggregate value::
>> +
>> +        uint64_t ret_child, ret_child2, ret_parent;
>> +
>> +        stats_fs_source_get_value(child_source, &kvm_stats[0], &ret_child);
>> +        stats_fs_source_get_value(parent_source, &kvm_stats[0], &ret_parent);
>> +        stats_fs_source_get_value(child_source2, &kvm_stats[0], &ret_child2);
>> +
>> +        assert((ret_child + ret_child2) == ret_parent);
>> +
>> +Cleanup::
>> +
>> +        stats_fs_source_remove_subordinate(parent_source, child_source);
>> +        stats_fs_source_revoke(child_source);
>> +        stats_fs_source_put(child_source);
>> +
>> +        stats_fs_source_remove_subordinate(parent_source, child_source2);
>> +        stats_fs_source_revoke(child_source2);
>> +        stats_fs_source_put(child_source2);
>> +
>> +        stats_fs_source_put(parent_source);
>> +        kfree(other_base_ptr);
>> +        kfree(base_ptr);
>> +
>> +Calling stats_fs_source_revoke is very important, because it will ensure
> 
>             stats_fs_source_revoke()
> 
>> +that stats_fs will not access the data that were passed to
>> +stats_fs_source_add_value for this source.
>> +
>> +Because open files increase the reference count for a stats_fs_source, the
>> +source can end up living longer than the data that provides the values for
>> +the source.  Calling stats_fs_source_revoke just before the backing data
> 
>                          stats_fs_source_revoke()
> 
>> +is freed avoids accesses to freed data structures. The sources will return
>> +0.
>> +
>> +This is not needed for the parent_source, since it just contains
>> +aggregates that would be 0 anyways if no matching child value exist.
>> +
>> +API Documentation
>> +=================
>> +
>> +.. kernel-doc:: include/linux/stats_fs.h
>> +   :export: fs/stats_fs/*.c
>> \ No newline at end of file
> 
> Please fix that. ^^^^^
> 
> 
> Thanks for the documentation.
> 

Thank you for the feedback,
Emanuele
