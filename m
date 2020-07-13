Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C206B21E17E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 22:34:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5FkC6WKdzDqY3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 06:34:27 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=default header.b=cHdBGMUw; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B5FhP0HcDzDqYP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 06:32:53 +1000 (AEST)
Received: from [10.0.0.249] (c-24-19-135-168.hsd1.wa.comcast.net
 [24.19.135.168])
 by linux.microsoft.com (Postfix) with ESMTPSA id CAADF20B4909;
 Mon, 13 Jul 2020 13:32:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CAADF20B4909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1594672371;
 bh=VeWN4l0WTivLpVxHyd7AaFSTibjlEMzXV0jVP3Zo+E4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cHdBGMUwa6d7vQELISebugbZOJJPgfylgs+Ow4juQxNZlH84Uew4znIMhI1ctPIqj
 H3I0N3rghH+OPS5b0/jhoIQBL8VUHOjGPpO6T+NSQaCMWJ5VU3jNPyjiJGtaOjHTVC
 7dGIyN+NRs9Dp/ZrXQdYTJ5ocXPgoEQ4OChP6Zbc=
Subject: Re: [V2 PATCH 2/3] dt-bindings: chosen: Document ima-kexec-buffer
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
References: <20200618071045.471131-1-prsriva@linux.microsoft.com>
 <20200618071045.471131-3-prsriva@linux.microsoft.com>
 <87mu4yr2k2.fsf@morokweng.localdomain>
From: Prakhar Srivastava <prsriva@linux.microsoft.com>
Message-ID: <80813a16-be43-3fc4-4812-33c60095a423@linux.microsoft.com>
Date: Mon, 13 Jul 2020 13:32:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87mu4yr2k2.fsf@morokweng.localdomain>
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
 robh+dt@kernel.org, hsinyi@chromium.org, tusharsu@linux.microsoft.com,
 tglx@linutronix.de, allison@lohutok.net, christophe.leroy@c-s.fr,
 mbrugger@suse.com, balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 james.morse@arm.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/19/20 5:41 PM, Thiago Jung Bauermann wrote:
> 
> Prakhar Srivastava <prsriva@linux.microsoft.com> writes:
> 
>> Integrity measurement architecture(IMA) validates if files
>> have been accidentally or maliciously altered, both remotely and
>> locally, appraise a file's measurement against a "good" value stored
>> as an extended attribute, and enforce local file integrity.
>>
>> IMA also measures singatures of kernel and initrd during kexec along with
>> the command line used for kexec.
>> These measurements are critical to verify the seccurity posture of the OS.
>>
>> Resering memory and adding the memory information to a device tree node
>> acts as the mechanism to carry over IMA measurement logs.
>>
>> Update devicetree documentation to reflect the addition of new property
>> under the chosen node.
> 
> Thank you for writing this documentation patch. It's something I should
> have done when I added the powerpc IMA kexec support.
> 
> You addressed Rob Herring's comments regarding the commit message, but
> not the ones regarding the patch contents.
> 
> When posting a new version of the patches, make sure to address all
> comments made so far. Addressing a comment doesn't necessarily mean
> implementing the requested change. If you don't then you should at least
> explain why you chose a different path.
> 
> I mention it because this has occurred before with this patch series,
> and it's hard to make forward progress if review comments get ignored.
> 
>> ---
>>   Documentation/devicetree/bindings/chosen.txt | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
>> index 45e79172a646..a15f70c007ef 100644
>> --- a/Documentation/devicetree/bindings/chosen.txt
>> +++ b/Documentation/devicetree/bindings/chosen.txt
>> @@ -135,3 +135,20 @@ e.g.
>>   		linux,initrd-end = <0x82800000>;
>>   	};
>>   };
>> +
>> +linux,ima-kexec-buffer
>> +----------------------
>> +
>> +This property(currently used by powerpc, arm64) holds the memory range,
> 
> space before the parenthesis.
> 
>> +the address and the size, of the IMA measurement logs that are being carried
> 
> Maybe it's because English isn't my first language, but IMHO it's
> clearer if "the address and the size" is between parentheses rather than
> commas.
> 
>> +over to the kexec session.
> 
> I don't think there's a "kexec session", but I'm not sure what a good
> term would be. "linux,booted-from-kexec" uses "new kernel" so perhaps
> that's a good option to use instead of "kexec session".
> 
>> +
>> +/ {
>> +	chosen {
>> +		linux,ima-kexec-buffer = <0x9 0x82000000 0x0 0x00008000>;
>> +	};
>> +};
>> +
>> +This porperty does not represent real hardware, but the memory allocated for
>> +carrying the IMA measurement logs. The address and the suze are expressed in
>> +#address-cells and #size-cells, respectively of the root node.
> 
> 
I will update the descriptions and ack the comments/changes in the 
patches as well.

Thankyou,
Prakhar Srivastava
> --
> Thiago Jung Bauermann
> IBM Linux Technology Center
> 
