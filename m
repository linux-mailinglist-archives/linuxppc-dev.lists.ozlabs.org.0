Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6777D31737C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 23:37:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbZPq6SgTzDwkq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 09:37:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=onouFjqo; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DbZMT4SMxzDwjD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 09:35:01 +1100 (AEDT)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 04C8120B6C40;
 Wed, 10 Feb 2021 14:34:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 04C8120B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1612996499;
 bh=C4RT2DxXX8r0QxWsc1tHKf/MPo20abgRwaNI176DYPI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=onouFjqolPpuZU+smvyVOWVYonhp8wE62mGs4xFoCMBc41e1Qh93K7Mi9KTvGbtmN
 UAzqFqtJBtcopTyxJ1GQNHoEHiXrWLeTs8SeDEQWYK2LTomPeu/bu09ptLZCtKjF1l
 qJESL6CaYdPTWm0FK8vjjxpDP90Z9TdzZbUyzDZo=
Subject: Re: [PATCH v17 00/10] Carry forward IMA measurement log on kexec on
 ARM64
To: Mimi Zohar <zohar@linux.ibm.com>, Rob Herring <robh@kernel.org>
References: <20210209182200.30606-1-nramas@linux.microsoft.com>
 <20210210171500.GA2328209@robh.at.kernel.org>
 <5c002c32-bc49-acda-c641-7b1494ea292d@linux.microsoft.com>
 <CAL_JsqLmdqfFF8u=dE+dQz+6ngv=moWkQF8tpZjUCX-vHuvU_w@mail.gmail.com>
 <cf7930239b93044a1be353556b7dc730e024f658.camel@linux.ibm.com>
 <594445d01e085875b97b46be726247f89d1e6661.camel@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <82fec498-b1c0-7acd-cf1e-8bb40a4e688e@linux.microsoft.com>
Date: Wed, 10 Feb 2021 14:34:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <594445d01e085875b97b46be726247f89d1e6661.camel@linux.ibm.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
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
Cc: Mark Rutland <mark.rutland@arm.com>, tao.li@vivo.com,
 Paul Mackerras <paulus@samba.org>, vincenzo.frascino@arm.com,
 Frank Rowand <frowand.list@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, James Morris <jmorris@namei.org>,
 "AKASHI, Takahiro" <takahiro.akashi@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, devicetree@vger.kernel.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Will Deacon <will@kernel.org>,
 Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Matthias Brugger <mbrugger@suse.com>, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/10/21 1:39 PM, Mimi Zohar wrote:
> On Wed, 2021-02-10 at 15:55 -0500, Mimi Zohar wrote:
>> On Wed, 2021-02-10 at 14:42 -0600, Rob Herring wrote:
>>> On Wed, Feb 10, 2021 at 11:33 AM Lakshmi Ramasubramanian
>>
>>> Ideally, we don't apply the same patch in 2 branches. It looks like
>>> there's a conflict but no real dependence on the above patch (the
>>> ima_buffer part). The conflict seems trivial enough that Linus can
>>> resolve it in the merge window.
>>>
>>> Or Mimi can take the whole thing if preferred?
>>
>> How about I create a topic branch with just the two patches, allowing
>> both of us to merge it?   There shouldn't be a problem with re-writing
>> next-integrity history.
> 
> The 2 patches are now in the ima-kexec-fixes branch.
> 

Thanks a lot Mimi.

Rob - I will address the 2 comments you'd provided today, and build the 
patches in ima-kexec-fixes branch.

If you have more comments in the v17 patches, please let me know.

thanks,
  -lakshmi

