Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2961F14E3B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 21:13:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487s4V2YWmzDqVp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 07:13:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=ndfont@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EM7GjmqY; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487lfx6qm5zDqXt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 03:09:39 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id 66so3599020otd.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 08:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c85UXDffSb2PXv2XpV6UzKNMBIzxhdNtxwM+oiL4ZfE=;
 b=EM7GjmqYIBO2WAnrvccmL3zonHAn+mRqth2qs6/SwOaauF5pna+ED/XapC1LRHMnRO
 QwwPWQbR+MZN5cas22iyUJowvCXZgVBOfVffSDO7v6Er/pLrZ6F7RFFEUJ8q54bxcBTu
 UWl0Sf3pEf6ylzzoMRw/vic+iXLSmxw0hpzN+uaw+B7b6zfatIE7GKrrAsf+S1AWc7XZ
 Gkk7bsBtQIgXRWdWxYuEAQEXvYMDlcNwBvBDkurnNzoadv4JoU1r51YCOLwiCutwifOs
 iI/8KZ8vrOnrmyGsM6DyN0MScG7siymJysokG5qKl9uSO7riuU19hy7Hk9trrySjGfJ1
 sP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c85UXDffSb2PXv2XpV6UzKNMBIzxhdNtxwM+oiL4ZfE=;
 b=W3cxUdjKs+2l99LwK8RsJa0LnMrFxN9p8XN3JLmEVVoTt0dtc4nRUf47RFXsNubNR5
 cUmqTKpkzr8xZIPQA9lJKvco2kmHD82ZGV2fa12Of11yALnOnZKWl/Hqg8dhOm60NabC
 D4LsoPZZEq17N8YqyWKV1tgvD2hovTOkVmuYmL81MTWU/zDq6LWM1/cBL+tnO14QMicA
 J86GhsQGC9insbKJMZWOBjZw8A1YGU/31WKxm/Htf7CX4i4wewtKY9zGfC+6T7mx1FRJ
 j+pWrqwADrhuEK7G3o+/IWoT95nqivSqiWLqod9g1dKpS1I1NxDHOB9cIg2xiAcd+xAO
 7XuA==
X-Gm-Message-State: APjAAAUgWf3C4zMs/hZ6dsPsVofrhmnuq4+w53ek2SMxOPgcE6epKECD
 Q/2My0W93qN6UMl9WJchVg==
X-Google-Smtp-Source: APXvYqwa9xjKXt29xk4s3SxDL1xFfz94p2+LDPjwwMGl0PNRiE7Fyb8nzl+Z4QUOT8sgvoLMeuA5iw==
X-Received: by 2002:a9d:7590:: with SMTP id s16mr3832406otk.89.1580400573885; 
 Thu, 30 Jan 2020 08:09:33 -0800 (PST)
Received: from [10.236.30.189] ([165.204.77.1])
 by smtp.gmail.com with ESMTPSA id m15sm1969943otr.65.2020.01.30.08.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 08:09:33 -0800 (PST)
Subject: Re: [PATCH] powerpc/drmem: cache LMBs in xarray to accelerate lookup
To: Scott Cheloha <cheloha@linux.ibm.com>, Nathan Lynch <nathanl@linux.ibm.com>
References: <20200128221113.17158-1-cheloha@linux.ibm.com>
 <87pnf3i188.fsf@linux.ibm.com>
 <20200129181013.lz6q5lpntnhwclqi@rascal.austin.ibm.com>
From: "Fontenot, Nathan" <ndfont@gmail.com>
Message-ID: <4dfb2f93-7af8-8c5f-854c-22afead18a8c@gmail.com>
Date: Thu, 30 Jan 2020 10:09:32 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129181013.lz6q5lpntnhwclqi@rascal.austin.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 31 Jan 2020 07:10:29 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/29/2020 12:10 PM, Scott Cheloha wrote:
> On Tue, Jan 28, 2020 at 05:56:55PM -0600, Nathan Lynch wrote:
>> Scott Cheloha <cheloha@linux.ibm.com> writes:
>>> LMB lookup is currently an O(n) linear search.  This scales poorly when
>>> there are many LMBs.
>>>
>>> If we cache each LMB by both its base address and its DRC index
>>> in an xarray we can cut lookups to O(log n), greatly accelerating
>>> drmem initialization and memory hotplug.
>>>
>>> This patch introduces two xarrays of of LMBs and fills them during
>>> drmem initialization.  The patch also adds two interfaces for LMB
>>> lookup.
>>
>> Good but can you replace the array of LMBs altogether
>> (drmem_info->lmbs)? xarray allows iteration over the members if needed.
> 
> I don't think we can without potentially changing the current behavior.
> 
> The current behavior in dlpar_memory_{add,remove}_by_ic() is to advance
> linearly through the array from the LMB with the matching DRC index.
> 
> Iteration through the xarray via xa_for_each_start() will return LMBs
> indexed with monotonically increasing DRC indices.> 
> Are they equivalent?  Or can we have an LMB with a smaller DRC index
> appear at a greater offset in the array?
> 
> If the following condition is possible:
> 
> 	drmem_info->lmbs[i].drc_index > drmem_info->lmbs[j].drc_index
> 
> where i < j, then we have a possible behavior change because
> xa_for_each_start() may not return a contiguous array slice.  It might
> "leap backwards" in the array.  Or it might skip over a chunk of LMBs.
> 

The LMB array should have each LMB in monotonically increasing DRC Index
value. Note that this is set up based on the DT property but I don't recall
ever seeing the DT specify LMBs out of order or not being contiguous.

I am not very familiar with xarrays but it appears this should be possible.

-Nathan
