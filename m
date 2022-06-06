Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AD953E4A0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 15:08:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGv1T6cnMz3bn5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 23:08:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=J7lZtYY4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=2a00:1098:0:82:1000:25:2eeb:e5ab; helo=madras.collabora.co.uk; envelope-from=dmitry.osipenko@collabora.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=J7lZtYY4;
	dkim-atps=neutral
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGv0r74FNz2xXw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 23:07:38 +1000 (AEST)
Received: from [192.168.2.145] (109-252-138-163.dynamic.spd-mgts.ru [109.252.138.163])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E0FE76601E95;
	Mon,  6 Jun 2022 14:07:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654520855;
	bh=LSsMVAQZyPb3UHQGiFXE07RX1x68iQrPgzsQm/Y6N8k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J7lZtYY4Cuoa9mBoGgmh7HzBulDfQSltbib9XF0llbPdiEZUwfyVZy75VhebvcF6x
	 LfmN/6WvLMFFEd57Xiq7Uzj+VOp0wfPESDbkDSRDN6xRfXFaLAm4pYCXfTKCIrWFm6
	 I+X9pOVA9y74JXswamQvAzNzliEeOrb5vaFb2pmkT5f1/ClW23KrVJzH+FPh9bWfFi
	 rm98yIYgZ2/sQ022F4i2iXIM+DIY0sElaY+mEkqwrv2OmPUZuJ+eQtTxFBedW+5+NQ
	 2F6zphwJ+8t02wTzUfaL3YwkCUl/mWTeXfB6lLJvQR/OJVYwnCxTbFcT9A2j0v4cD/
	 ZVYJRqnvVnp8g==
Message-ID: <5dbf4f96-7218-f238-5426-1ad0b4045aeb@collabora.com>
Date: Mon, 6 Jun 2022 16:07:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1] kernel/reboot: Change registration order of legacy
 power-off handler
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20220524212118.425702-1-dmitry.osipenko@collabora.com>
 <8735gjq365.fsf@mpe.ellerman.id.au>
 <e597fd8e-d0d1-dd1c-b889-86cfca60f0f6@collabora.com>
 <87r142ndps.fsf@mpe.ellerman.id.au>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <87r142ndps.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/6/22 16:06, Michael Ellerman wrote:
> Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:
>> Hi Michael,
>>
>> On 6/5/22 05:01, Michael Ellerman wrote:
>>> Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:
>>>> We're unconditionally registering sys-off handler for the legacy
>>>> pm_power_off() callback, this causes problem for platforms that don't
>>>> use power-off handlers at all and should be halted. Now reboot syscall
>>>> assumes that there is a power-off handler installed and tries to power
>>>> off system instead of halting it.
>>>>
>>>> To fix the trouble, move the handler's registration to the reboot syscall
>>>> and check the pm_power_off() presence.
>>>
>>> I'm seeing a qemu virtual machine (ppce500) fail to power off using the
>>> gpio-poweroff driver. I bisected it to this commit.
>>>
>>> I think the problem is that the machine is going via kernel_power_off(),
>>> not sys_reboot(), and so legacy_pm_power_off() has not been registered.
>>>
>>> If I just put the core_initcall back then it works as before. Not sure
>>> if that's a safe change in general though.
>>
>> Thank you very much for the testing and reporting the problem! I see now the two more cases that were missed previously:
>>
>> 1. There is the orderly_poweroff() used by some drivers.
>> 2. PowerPC may invoke do_kernel_power_off() directly from xmon code.
>>
>> Could you please test this change:
> 
> That works, thanks.
> 
> I tested both sysrq-o and the xmon power off path.
> 
> I couldn't come up with an easy way to test the orderly_poweroff()
> path, but it boils down to basically the same code in the end.
> 
> Tested-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> cheers

Awesome, thank you!

-- 
Best regards,
Dmitry
