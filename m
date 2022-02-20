Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EE74BCE70
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 13:23:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1l2k2pXcz3cX7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 23:23:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S1UgBHs1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=ikegami.t@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=S1UgBHs1; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1l203Vwtz2yZt
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 23:22:46 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 195so11900534pgc.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 04:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to;
 bh=R/byEbuYodbqN/dTPHwwxQlwg4dzRor/JniFcuJDSKE=;
 b=S1UgBHs1HP7eKCMW/3QD9FOXwFcbC2X8M+6jGH5BpE2tl5oEkOohLpbsE3faKMi9FV
 FfheFJ0MoF3ltIqOXbGlhXGu7KI3QkPfD9m7qo/DKLKoS5SPLW4IJFLvXRP+U4FuzFer
 Dwj6iKG1o2au70Ew1XB9fU+VrCp98pxpBrXAGJzSF+xoDAazkA25F77T09dKp5B1ebdo
 UTyZTFnpgJzd3kij+TX0UgPF2otbyVyglKvN75R4/BVadTYSeSEXWb2njc57i+FHND8O
 IyglnN3Xot3sbKFpGkPvnBrff3t/usJxQzGt533x+xRILuaw8pJ3yPCoQj5g5lLs/f3g
 61wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to;
 bh=R/byEbuYodbqN/dTPHwwxQlwg4dzRor/JniFcuJDSKE=;
 b=ES5AICL070edthB+l/Denx6OAfFAhtra5XeWfFzbKt6lO9XqYMN/j7dG6Un6962g3K
 uiBuV0liEiJuqYwiR6/UXE9cP8iE89uaNwNW6de9mCu0Rg5EnJs79QRMKCg5woYm/cYg
 I8pjP4IJ7cAyv15hLpRQV6S+q+wacUmMfDbsCK52n6fwrjKwY+SYEzwSi42iNZVBR6vY
 g32DwmTxQMBHytQEOsoYkRIt1DcmJCu13REJrHrp09OVudQ/cZAuT2yUqqb7QKe9IWkZ
 8pdhZdkjccB1xd5gCoZxTuAqfVvxG8GcSv15GJ/sJ6TZ3WPAnJAtHQpkk/PJ4Iam1XNp
 4rOw==
X-Gm-Message-State: AOAM531Xeob7NWpsbpZXvbVfxYEaTVv6ZMppJC+Z2Vz4pU22t2GtAjia
 KlUYlFAocZGkFOFG45KJ6v8=
X-Google-Smtp-Source: ABdhPJw/4Aaa7RtOHrKYtjwy7+QQw4VGAuHEaCrTJCc44sCDXC002+58LkOyBdvEfa8p3Gj3lKtPcw==
X-Received: by 2002:a63:b50b:0:b0:373:9242:6b98 with SMTP id
 y11-20020a63b50b000000b0037392426b98mr12466709pge.553.1645359762402; 
 Sun, 20 Feb 2022 04:22:42 -0800 (PST)
Received: from ?IPV6:240b:10:2720:5500:2f07:a2ba:6742:b651?
 ([240b:10:2720:5500:2f07:a2ba:6742:b651])
 by smtp.gmail.com with ESMTPSA id 8sm9163488pfl.164.2022.02.20.04.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 04:22:40 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------400X6pDu0Eno4T3y93R0zub0"
Message-ID: <117facba-ba33-349d-1085-25315cc1ae92@gmail.com>
Date: Sun, 20 Feb 2022 21:22:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [BUG] mtd: cfi_cmdset_0002: write regression since v4.17-rc1
Content-Language: en-US
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 linux-mtd@lists.infradead.org, Joakim.Tjernlund@infinera.com,
 miquel.raynal@bootlin.com, vigneshr@ti.com, richard@nod.at,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de>
 <dff2abcc-5813-2f2c-35ba-f03cd1f35ac3@leemhuis.info>
 <e11b76dc-5539-fb7e-da1c-a5005713d6b0@gmail.com>
 <3dbbcee5-81fc-cdf5-9f8b-b6ccb95beddc@pengutronix.de>
 <0f2cfcac-83ca-51a9-f92c-ff6495dca1d7@gmail.com>
 <b231b498-c8d2-28af-ce66-db8c168047f7@pengutronix.de>
 <66ee55d9-4f20-6722-6097-e53c2108ea07@gmail.com>
 <579eab10-594c-d6b2-0ddb-ea6ab8e02856@pengutronix.de>
 <cedb1604-e024-2738-5b33-15703a653803@gmail.com>
In-Reply-To: <cedb1604-e024-2738-5b33-15703a653803@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 marek.vasut@gmail.com, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, cyrille.pitchen@wedev4u.fr,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------400X6pDu0Eno4T3y93R0zub0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ahmad-san,

Could you please try the version 2 patch attached for the error case?
This version is to check the DQ true data 0xFF by chip_good().
But I am not sure if this works or not since the error is possible to be 
caused by Hi-Z 0xff on floating bus or etc.

On 2022/02/15 3:46, Tokunori Ikegami wrote:
> Hi Ahmad-san,
>
> On 2022/02/15 1:22, Ahmad Fatoum wrote:
>> Hello Tokunori-san,
>>
>> On 13.02.22 17:47, Tokunori Ikegami wrote:
>>> Hi Ahmad-san,
>>>
>>> Thanks for your confirmations. Sorry for late to reply.
>> No worries. I appreciate you taking the time.
>>
>>> Could you please try the patch attached to disable the chip_good() 
>>> change as before?
>>> I think this should work for S29GL964N since the chip_ready() is 
>>> used and works as mentioned.
>> yes, this resolves my issue:
>> Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Thanks for your testing. I have just sent the patch to review.
>>
>>>>>> Doesn't seem to be a buffered write issue here though as the writes
>>>>>> did work fine before dfeae1073583. Any other ideas?
>>>>> At first I thought the issue is possible to be resolved by using 
>>>>> the word write instead of the buffered writes.
>>>>> Now I am thinking to disable the changes dfeae1073583 partially 
>>>>> with any condition if possible.
>>>> What seems to work for me is checking if chip_good or chip_ready
>>>> and map_word is equal to 0xFF. I can't justify why this is ok though.
>>>> (Worst case bus is floating at this point of time and Hi-Z is read
>>>> as 0xff on CPU data lines...)
>>> Sorry I am not sure about this.
>>> I thought the chip_ready() itself is correct as implemented as the 
>>> data sheet in the past.
>>> But it did not work correctly so changed to use chip_good() instead 
>>> as it is also correct.
>> What exactly in the datasheet makes you believe chip_good is not 
>> appropriate?
> I just mentioned about the actual issue behaviors as not worked 
> chip_good() on S29GL964N and not worked chip_ready() on 
> MX29GL512FHT2I-11G before etc.
> Anyway let me recheck the data sheet details as just checked it again 
> quickly but needed more investigation to understand.

As far as I checked still both chip_good() and chip_ready() seem correct 
but still the root cause is unknown.
If as you mentioned the issue was cased by the DQ true data 0xFF I am 
not sure why the read work without any error after the write operation.
Also if the error was caused by the Hi-Z 0xff on floating bus as 
mentioned I am not sure why the read work without any error after the 
write operation with chip_ready().
Sorry anyway the root cause is also unknown when the write operation was 
changed to use chip_good() instead of chip_ready().

Regards,
Ikegami

>
> Regards,
> Ikegami
>
>>
>> Cheers,
>> Ahmad
>>
>>
--------------400X6pDu0Eno4T3y93R0zub0
Content-Type: text/x-patch; charset=UTF-8;
 name="v2-0001-mtd-cfi_cmdset_0002-Change-chip_good-to-check-DQ-.patch"
Content-Disposition: attachment;
 filename*0="v2-0001-mtd-cfi_cmdset_0002-Change-chip_good-to-check-DQ-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAyYmVmMDJiZWU4ZmE3NDI3M2NmYzc2NGUyODhiNmY5MmI4NjQ2YmI3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUb2t1bm9yaSBJa2VnYW1pIDxpa2VnYW1pLnRAZ21h
aWwuY29tPgpEYXRlOiBTYXQsIDE5IEZlYiAyMDIyIDE5OjM5OjMyICswOTAwClN1YmplY3Q6
IFtQQVRDSCB2Ml0gbXRkOiBjZmlfY21kc2V0XzAwMDI6IENoYW5nZSBjaGlwX2dvb2QoKSB0
byBjaGVjayBEUSB0cnVlCiBkYXRhIDB4RkYKClRoZSByZWdyZXNzaW9uIGlzc3VlIGhhcyBi
ZWVuIGNhdXNlZCBvbiBTMjlHTDA2NE4gYW5kIHJlcG9ydGVkIGl0LgpUaGUgY2hhbmdlIG1l
bnRpb25lZCBmb3IgcmVncmVzc2lvbiBpcyB0byB1c2UgY2hpcF9nb29kKCkgZm9yIGJ1ZmZl
cmVkIHdyaXRlLgpBbHNvIGl0IHNlZW1zIHRoYXQgdGhlIDB4RkYgdmFsdWUgaXMgcmVhZCBv
biB0aGUgZXJyb3IgY2FzZS4KSXQgaXMgcG9zc2libGUgdG8gYmUgY2F1c2VkIGJ5IERRIHRy
dWUgZGF0YSBkZXNjcmliZWQgYnkgUzI5R0wwNjROIGRhdGFzaGVldC4KU28gY2hhbmdlIGNo
aXBfZ29vZCgpIHRvIGNoZWNrIERRIHRydWUgZGF0YSAweEZGIGFkZGl0aW9uYWxseSBmb3Ig
dGhlIGVycm9yLgoKRml4ZXM6IGRmZWFlMTA3MzU4MygibXRkOiBjZmlfY21kc2V0XzAwMDI6
IENoYW5nZSB3cml0ZSBidWZmZXIgdG8gY2hlY2sgY29ycmVjdCB2YWx1ZSIpClNpZ25lZC1v
ZmYtYnk6IFRva3Vub3JpIElrZWdhbWkgPGlrZWdhbWkudEBnbWFpbC5jb20+CkNjOiBsaW51
eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvY2VkYjE2MDQtZTAyNC0y
NzM4LTViMzMtMTU3MDNhNjUzODAzQGdtYWlsLmNvbS8KLS0tCiBkcml2ZXJzL210ZC9jaGlw
cy9jZmlfY21kc2V0XzAwMDIuYyB8IDI1ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYyBiL2RyaXZlcnMv
bXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCmluZGV4IGE3NjExMzRmZDNiZS4uMDc5ZjY5
ZTU0MDBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIu
YworKysgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwpAQCAtODUzLDcg
Kzg1Myw3IEBAIHN0YXRpYyBpbnQgX194aXByYW0gY2hpcF9yZWFkeShzdHJ1Y3QgbWFwX2lu
Zm8gKm1hcCwgc3RydWN0IGZsY2hpcCAqY2hpcCwKICAqCiAgKi8KIHN0YXRpYyBpbnQgX194
aXByYW0gY2hpcF9nb29kKHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpj
aGlwLAotCQkJICAgICAgdW5zaWduZWQgbG9uZyBhZGRyLCBtYXBfd29yZCBleHBlY3RlZCkK
KwkJCSAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciwgbWFwX3dvcmQgKmV4cGVjdGVkKQogewog
CXN0cnVjdCBjZmlfcHJpdmF0ZSAqY2ZpID0gbWFwLT5mbGRydl9wcml2OwogCW1hcF93b3Jk
IG9sZGQsIGN1cmQ7CkBAIC04NzUsOCArODc1LDEzIEBAIHN0YXRpYyBpbnQgX194aXByYW0g
Y2hpcF9nb29kKHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAog
CW9sZGQgPSBtYXBfcmVhZChtYXAsIGFkZHIpOwogCWN1cmQgPSBtYXBfcmVhZChtYXAsIGFk
ZHIpOwogCi0JcmV0dXJuCW1hcF93b3JkX2VxdWFsKG1hcCwgb2xkZCwgY3VyZCkgJiYKLQkJ
bWFwX3dvcmRfZXF1YWwobWFwLCBjdXJkLCBleHBlY3RlZCk7CisJaWYgKCFtYXBfd29yZF9l
cXVhbChtYXAsIG9sZGQsIGN1cmQpKQorCQlyZXR1cm4gMDsKKworCWlmIChleHBlY3RlZCAm
JiBtYXBfd29yZF9lcXVhbChtYXAsIGN1cmQsICpleHBlY3RlZCkpCisJCXJldHVybiAxOwor
CisJcmV0dXJuIG1hcF93b3JkX2VxdWFsKG1hcCwgb2xkZCwgbWFwX3dvcmRfZmYobWFwKSk7
CiB9CiAKIHN0YXRpYyBpbnQgZ2V0X2NoaXAoc3RydWN0IG1hcF9pbmZvICptYXAsIHN0cnVj
dCBmbGNoaXAgKmNoaXAsIHVuc2lnbmVkIGxvbmcgYWRyLCBpbnQgbW9kZSkKQEAgLTE2OTks
NyArMTcwNCw3IEBAIHN0YXRpYyBpbnQgX194aXByYW0gZG9fd3JpdGVfb25ld29yZF9vbmNl
KHN0cnVjdCBtYXBfaW5mbyAqbWFwLAogCQkgKiAiY2hpcF9nb29kIiB0byBhdm9pZCB0aGUg
ZmFpbHVyZSBkdWUgdG8gc2NoZWR1bGluZy4KIAkJICovCiAJCWlmICh0aW1lX2FmdGVyKGpp
ZmZpZXMsIHRpbWVvKSAmJgotCQkgICAgIWNoaXBfZ29vZChtYXAsIGNoaXAsIGFkciwgZGF0
dW0pKSB7CisJCSAgICAhY2hpcF9nb29kKG1hcCwgY2hpcCwgYWRyLCAmZGF0dW0pKSB7CiAJ
CQl4aXBfZW5hYmxlKG1hcCwgY2hpcCwgYWRyKTsKIAkJCXByaW50ayhLRVJOX1dBUk5JTkcg
Ik1URCAlcygpOiBzb2Z0d2FyZSB0aW1lb3V0XG4iLCBfX2Z1bmNfXyk7CiAJCQl4aXBfZGlz
YWJsZShtYXAsIGNoaXAsIGFkcik7CkBAIC0xNzA3LDcgKzE3MTIsNyBAQCBzdGF0aWMgaW50
IF9feGlwcmFtIGRvX3dyaXRlX29uZXdvcmRfb25jZShzdHJ1Y3QgbWFwX2luZm8gKm1hcCwK
IAkJCWJyZWFrOwogCQl9CiAKLQkJaWYgKGNoaXBfZ29vZChtYXAsIGNoaXAsIGFkciwgZGF0
dW0pKSB7CisJCWlmIChjaGlwX2dvb2QobWFwLCBjaGlwLCBhZHIsICZkYXR1bSkpIHsKIAkJ
CWlmIChjZmlfY2hlY2tfZXJyX3N0YXR1cyhtYXAsIGNoaXAsIGFkcikpCiAJCQkJcmV0ID0g
LUVJTzsKIAkJCWJyZWFrOwpAQCAtMTk3OSwxNCArMTk4NCwxNCBAQCBzdGF0aWMgaW50IF9f
eGlwcmFtIGRvX3dyaXRlX2J1ZmZlcl93YWl0KHN0cnVjdCBtYXBfaW5mbyAqbWFwLAogCQkg
KiAiY2hpcF9nb29kIiB0byBhdm9pZCB0aGUgZmFpbHVyZSBkdWUgdG8gc2NoZWR1bGluZy4K
IAkJICovCiAJCWlmICh0aW1lX2FmdGVyKGppZmZpZXMsIHRpbWVvKSAmJgotCQkgICAgIWNo
aXBfZ29vZChtYXAsIGNoaXAsIGFkciwgZGF0dW0pKSB7CisJCSAgICAhY2hpcF9nb29kKG1h
cCwgY2hpcCwgYWRyLCAmZGF0dW0pKSB7CiAJCQlwcl9lcnIoIk1URCAlcygpOiBzb2Z0d2Fy
ZSB0aW1lb3V0LCBhZGRyZXNzOjB4JS44bHguXG4iLAogCQkJICAgICAgIF9fZnVuY19fLCBh
ZHIpOwogCQkJcmV0ID0gLUVJTzsKIAkJCWJyZWFrOwogCQl9CiAKLQkJaWYgKGNoaXBfZ29v
ZChtYXAsIGNoaXAsIGFkciwgZGF0dW0pKSB7CisJCWlmIChjaGlwX2dvb2QobWFwLCBjaGlw
LCBhZHIsICZkYXR1bSkpIHsKIAkJCWlmIChjZmlfY2hlY2tfZXJyX3N0YXR1cyhtYXAsIGNo
aXAsIGFkcikpCiAJCQkJcmV0ID0gLUVJTzsKIAkJCWJyZWFrOwpAQCAtMjI4Miw3ICsyMjg3
LDcgQEAgc3RhdGljIGludCBkb19wYW5pY193cml0ZV9vbmV3b3JkKHN0cnVjdCBtYXBfaW5m
byAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAogCQl1ZGVsYXkoMSk7CiAJfQogCi0JaWYg
KCFjaGlwX2dvb2QobWFwLCBjaGlwLCBhZHIsIGRhdHVtKSB8fAorCWlmICghY2hpcF9nb29k
KG1hcCwgY2hpcCwgYWRyLCAmZGF0dW0pIHx8CiAJICAgIGNmaV9jaGVja19lcnJfc3RhdHVz
KG1hcCwgY2hpcCwgYWRyKSkgewogCQkvKiByZXNldCBvbiBhbGwgZmFpbHVyZXMuICovCiAJ
CW1hcF93cml0ZShtYXAsIENNRCgweEYwKSwgY2hpcC0+c3RhcnQpOwpAQCAtMjQ3OCw3ICsy
NDgzLDcgQEAgc3RhdGljIGludCBfX3hpcHJhbSBkb19lcmFzZV9jaGlwKHN0cnVjdCBtYXBf
aW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwKQogCQkJY2hpcC0+ZXJhc2Vfc3VzcGVu
ZGVkID0gMDsKIAkJfQogCi0JCWlmIChjaGlwX2dvb2QobWFwLCBjaGlwLCBhZHIsIG1hcF93
b3JkX2ZmKG1hcCkpKSB7CisJCWlmIChjaGlwX2dvb2QobWFwLCBjaGlwLCBhZHIsIE5VTEwp
KSB7CiAJCQlpZiAoY2ZpX2NoZWNrX2Vycl9zdGF0dXMobWFwLCBjaGlwLCBhZHIpKQogCQkJ
CXJldCA9IC1FSU87CiAJCQlicmVhazsKQEAgLTI1NzcsNyArMjU4Miw3IEBAIHN0YXRpYyBp
bnQgX194aXByYW0gZG9fZXJhc2Vfb25lYmxvY2soc3RydWN0IG1hcF9pbmZvICptYXAsIHN0
cnVjdCBmbGNoaXAgKmNoaXAsCiAJCQljaGlwLT5lcmFzZV9zdXNwZW5kZWQgPSAwOwogCQl9
CiAKLQkJaWYgKGNoaXBfZ29vZChtYXAsIGNoaXAsIGFkciwgbWFwX3dvcmRfZmYobWFwKSkp
IHsKKwkJaWYgKGNoaXBfZ29vZChtYXAsIGNoaXAsIGFkciwgTlVMTCkpIHsKIAkJCWlmIChj
ZmlfY2hlY2tfZXJyX3N0YXR1cyhtYXAsIGNoaXAsIGFkcikpCiAJCQkJcmV0ID0gLUVJTzsK
IAkJCWJyZWFrOwotLSAKMi4zMi4wCgo=

--------------400X6pDu0Eno4T3y93R0zub0--
