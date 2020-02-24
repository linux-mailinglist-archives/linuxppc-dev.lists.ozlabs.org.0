Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F04E16A9F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 16:23:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48R5Rs5wRxzDqWt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 02:23:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=joe.lawrence@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=cbxcd3HP; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48R5PR3mY0zDqTd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 02:21:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582557670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jEBsfrvOwKqUt5ZlukWoSu1qTBe+MspkyGGBOY4qAmA=;
 b=cbxcd3HPa/j63N53QKO0tXr9i7n6FXnTscHtve0/M9QcpAvqqDEaNdT1Pciz6xAgjJkVK8
 P3Sn/z84vaO8iFRrsdboYQcyeep4WYm8hTxuZaqj0pDPFbT8lt6O6f+QGiYXTY/AgCrbz/
 N/K8asGXB8MwGuYPyfWkRqiuEsRdW3E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-I169pOMwMSyikq1rKcQ8lg-1; Mon, 24 Feb 2020 10:21:02 -0500
X-MC-Unique: I169pOMwMSyikq1rKcQ8lg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 480DCA0CC2;
 Mon, 24 Feb 2020 15:21:01 +0000 (UTC)
Received: from [10.18.17.119] (dhcp-17-119.bos.redhat.com [10.18.17.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC87B5C114;
 Mon, 24 Feb 2020 15:21:00 +0000 (UTC)
Subject: Re: vdso function descriptors (VDS64_HAS_DESCRIPTORS)?
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <20200217160852.GA9557@redhat.com>
 <20200223000715.GW22482@gate.crashing.org>
 <587a0a1765ba1264b92044f7b1f9937eb40731f1.camel@kernel.crashing.org>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <885be270-7af8-490d-302c-270a6db94ffe@redhat.com>
Date: Mon, 24 Feb 2020 10:20:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <587a0a1765ba1264b92044f7b1f9937eb40731f1.camel@kernel.crashing.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/24/20 5:17 AM, Benjamin Herrenschmidt wrote:
> On Sat, 2020-02-22 at 18:07 -0600, Segher Boessenkool wrote:
>>>
>>> so I don't believe they are ever used by default -- in this case
>>> V_FUNCTION_BEGIN doesn't add to the .opd section with .name, .TOC base,
>>> etc.
>>>
>>> Manually setting VDS64_HAS_DESCRIPTORS results in a vdso64.so in which
>>> binutils tools like readelf properly report functions with symbol type
>>> FUNC instead of NOTYPE.
>>>
>>> Are there pieces of the build/etc toolchain unprepared for function
>>> descriptors?  I'm just trying to figure out why the code defaults to
>>> unsetting them.
>>
>> Because direct calls are faster than indirect calls?  Ben might have a
>> fuller explanation, cc:ing him.
> 
> I don't remember why :-) I think I didn't want to mess with the OPD
> fixup in glibc back then.
> 

Does it make sense to just drop the unused VDS64_HAS_DESCRIPTORS code then?

-- Joe

