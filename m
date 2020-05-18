Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9FE1D893F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 22:36:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QrQN64t7zDqjp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 06:36:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=prsriva@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=LW4xKvNP; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 49QrN76GN4zDqfF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 06:34:31 +1000 (AEST)
Received: from [10.0.0.249] (c-24-19-135-168.hsd1.wa.comcast.net
 [24.19.135.168])
 by linux.microsoft.com (Postfix) with ESMTPSA id 57B3620B717B;
 Mon, 18 May 2020 13:34:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 57B3620B717B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1589834070;
 bh=6GRSvZ+sGLVcKGDOcmVDyb0gXRdx/T0QTMk1YgrIXo0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LW4xKvNPjvTQHNTCPc5dw87VMVrDKT0UTsZNlxXJSb2DhjQsGt1aArwi+2Pq25xMN
 S4zSHJ+EQn4yAg/KghG/RYbBFjia5QNFJZWhHHgsJ+dbDFHzqYrmxyRfw7yrJDSiU3
 PE4kQbDFbQkwN9xGgKO718cCWGbRNXaZolR1rV5E=
Subject: Re: [RFC][PATCH 1/2] Add a layer of abstraction to use the memory
 reserved by device tree for ima buffer pass.
To: Rob Herring <robh@kernel.org>
References: <20200504203829.6330-1-prsriva@linux.microsoft.com>
 <20200504203829.6330-2-prsriva@linux.microsoft.com>
 <20200512230954.GB2654@bogus>
From: Prakhar Srivastava <prsriva@linux.microsoft.com>
Message-ID: <8b8bb74b-a3ac-1eb8-4b21-d00402a2bf62@linux.microsoft.com>
Date: Mon, 18 May 2020 13:34:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512230954.GB2654@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: kstewart@linuxfoundation.org, mark.rutland@arm.com,
 gregkh@linuxfoundation.org, bhsharma@redhat.com, tao.li@vivo.com,
 zohar@linux.ibm.com, paulus@samba.org, vincenzo.frascino@arm.com,
 will@kernel.org, nramas@linux.microsoft.com, frowand.list@gmail.com,
 masahiroy@kernel.org, jmorris@namei.org, takahiro.akashi@linaro.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 serge@hallyn.com, devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 hsinyi@chromium.org, tusharsu@linux.microsoft.com, tglx@linutronix.de,
 allison@lohutok.net, christophe.leroy@c-s.fr, mbrugger@suse.com,
 balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 james.morse@arm.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/12/20 4:09 PM, Rob Herring wrote:
> On Mon, May 04, 2020 at 01:38:28PM -0700, Prakhar Srivastava wrote:
>> Introduce a device tree layer for to read and store ima buffer
>> from the reserved memory section of a device tree.
> 
> But why do I need 'a layer of abstraction'? I don't like them.
> 
This is a common path for the all architectures to carry over the
IMA measurement logs. A single layer will avoid any code duplication.

>> Signed-off-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
>> ---
>>   drivers/of/Kconfig  |   6 ++
>>   drivers/of/Makefile |   1 +
>>   drivers/of/of_ima.c | 165 ++++++++++++++++++++++++++++++++++++++++++++
> 
> Who are the users of this code and why does it need to be here? Most
> code for specific bindings are not in drivers/of/ but with the user. It
> doesn't sound like there's more than 1 user.
> 
Currently the path is exercised by arm64 kexec_file_load path. A slight
restructuring is needed on the powerpc side to use the same code path 
and other architectures can follow to add carrying over IMA logs over
kexec with just a few function calls.

I have attempted to bring the code path down to the highest common 
layer, however please do suggest if i can move this some where else.

Thanks,
Prakhar

>>   include/linux/of.h  |  34 +++++++++
>>   4 files changed, 206 insertions(+)
>>   create mode 100644 drivers/of/of_ima.c
