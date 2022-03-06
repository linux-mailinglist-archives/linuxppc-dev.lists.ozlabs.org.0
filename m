Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 565014CEC27
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Mar 2022 16:50:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBQz42Sfhz3bTj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 02:50:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Nc2fqHoT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=ikegami.t@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Nc2fqHoT; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBQyP1ZWbz2xY3
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Mar 2022 02:49:48 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 mr24-20020a17090b239800b001bf0a375440so9162712pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Mar 2022 07:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to;
 bh=iKa7k5SfVCfzzATQN9q6JAKUZNX+2kkckFzGpq84zGk=;
 b=Nc2fqHoT6OtKZba0CDPnZjCvCZt71kl2n9xvik3idJpP79RVZPu/gd6wmghz+1sTeX
 HZqrQ6hwJbV1gF0t0WT2yVU5p1+voZO87c135RXfcVnQRxwgWq4UnLUwHg+TNfVaQIWJ
 L/ZN2pexhPQjzdXVQTpCUsXMY2WVwIauM5dEe3APtf5Gp2TcqhRKVF7ISLHjnNMG9T52
 Bm80aOijCA2/wdKElstloGbFWnhII2ocrWpI5q0J65IIXrLg0HWqLEY2Y4gLEEPseRA3
 l1W+7AErVFpo1b683t1tG5Xh2OLHF3iNX3AXshhPciOKvhRhPHSp0SmpYGegjQSt26sL
 QFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to;
 bh=iKa7k5SfVCfzzATQN9q6JAKUZNX+2kkckFzGpq84zGk=;
 b=Cl/IlczyKNb5+tX7Ad8NHDUn7KdivHugpqxT6qp5Fi2OtjPsq05ccwcchSMtKbTAjH
 8ak/eWPwgUuG4juXg9QcFfp24vUkzeknqNz+4hGLOguVmpWH4dAqyrtgEEY0V6va01C/
 FZWyHeIEf6WT4BlQw9DvHTF7NPS+g5ywipbcMnC0PWi0HIzjHHan3EW01OFhkIhMWgCb
 SfNTgZHm6nGcQbzR+jkfFd0sNbF006rZTbyqTnmw7G8HC/2mr1dfOiGaCKQSuIEasTvg
 OcT/uvgdaiAIzNroaUPctpZBzInkx7zy26dg3Mdj44/DL8FrJPdVDg/xcXaVlLH/eF88
 4yzg==
X-Gm-Message-State: AOAM530T6LDHMy0dQwSNoWRqi9Q0qBEVAH/5aHVK4xYH1U0gI9wv4lp+
 VCE2TAjyvUSIGKdyodR899c=
X-Google-Smtp-Source: ABdhPJzYDZ0fkCnD/0VHrWoJ7v+XwIFJSYxjSjiR4XMIJUwGaEOSB3nn07oVYk+K4IZS/S7HMfIg8Q==
X-Received: by 2002:a17:90a:990c:b0:1bc:3c9f:2abe with SMTP id
 b12-20020a17090a990c00b001bc3c9f2abemr8743398pjp.220.1646581785992; 
 Sun, 06 Mar 2022 07:49:45 -0800 (PST)
Received: from ?IPV6:240b:10:2720:5500:7cd8:5236:546e:2b2c?
 ([240b:10:2720:5500:7cd8:5236:546e:2b2c])
 by smtp.gmail.com with ESMTPSA id
 p28-20020a056a000a1c00b004f6519e61b7sm13601015pfh.21.2022.03.06.07.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 07:49:45 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------K91juOuLpSSbXSC0vYcfI0J1"
Message-ID: <9621c512-06f2-17b2-5c68-943b1f0981eb@gmail.com>
Date: Mon, 7 Mar 2022 00:49:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [BUG] mtd: cfi_cmdset_0002: write regression since v4.17-rc1
Content-Language: en-US
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
 <117facba-ba33-349d-1085-25315cc1ae92@gmail.com>
 <f9e46b61-37e5-a280-edb0-27f8e81a8680@pengutronix.de>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <f9e46b61-37e5-a280-edb0-27f8e81a8680@pengutronix.de>
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
--------------K91juOuLpSSbXSC0vYcfI0J1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2022/03/04 20:11, Ahmad Fatoum wrote:
> Hello Tokunori-san,
>
> On 20.02.22 13:22, Tokunori Ikegami wrote:
>> Hi Ahmad-san,
>>
>> Could you please try the version 2 patch attached for the error case?
>> This version is to check the DQ true data 0xFF by chip_good().
> I had a similar patch locally as well at first. I just tested yours
> and I can't reproduce the issue.
Thanks for your support.
Sorry if possible could you please retest the attached the patch again 
since this fixed the version 1 patch maintainer review comments?
>
>> But I am not sure if this works or not since the error is possible to be caused by Hi-Z 0xff on floating bus or etc.
> That it works for me could be because of Hi-Z 0xff, which is why
> decided against it.
I see.
>
>>>>>> What seems to work for me is checking if chip_good or chip_ready
>>>>>> and map_word is equal to 0xFF. I can't justify why this is ok though.
>>>>>> (Worst case bus is floating at this point of time and Hi-Z is read
>>>>>> as 0xff on CPU data lines...)
>>>>> Sorry I am not sure about this.
>>>>> I thought the chip_ready() itself is correct as implemented as the data sheet in the past.
>>>>> But it did not work correctly so changed to use chip_good() instead as it is also correct.
>>>> What exactly in the datasheet makes you believe chip_good is not appropriate?
>>> I just mentioned about the actual issue behaviors as not worked chip_good() on S29GL964N and not worked chip_ready() on MX29GL512FHT2I-11G before etc.
>>> Anyway let me recheck the data sheet details as just checked it again quickly but needed more investigation to understand.
>> As far as I checked still both chip_good() and chip_ready() seem correct but still the root cause is unknown.
>> If as you mentioned the issue was cased by the DQ true data 0xFF I am not sure why the read work without any error after the write operation.
>> Also if the error was caused by the Hi-Z 0xff on floating bus as mentioned I am not sure why the read work without any error after the write operation with chip_ready().
>> Sorry anyway the root cause is also unknown when the write operation was changed to use chip_good() instead of chip_ready().
> I've be ok with v1 then. Restores working behavior for me and shouldn't break others.

Noted but still I am thinking the version 2 patch to check 0xff seems 
better than to use chip_ready() so let me consider this again later.

Regards,
Ikegami

>
> Cheers and thanks again,
> Ahmad
>
>> Regards,
>> Ikegami
>>
>>> Regards,
>>> Ikegami
>>>
>>>> Cheers,
>>>> Ahmad
>>>>
>>>>
>
--------------K91juOuLpSSbXSC0vYcfI0J1
Content-Type: text/x-patch; charset=UTF-8;
 name="v2-0001-mtd-cfi_cmdset_0002-Use-chip_ready-for-write-on-S.patch"
Content-Disposition: attachment;
 filename*0="v2-0001-mtd-cfi_cmdset_0002-Use-chip_ready-for-write-on-S.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAzMDZmNzI2NmNiMmI2ZDA3YmJjNTg4MmIzYjk3NzI2NDQ4M2FkMTI4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUb2t1bm9yaSBJa2VnYW1pIDxpa2VnYW1pLnRAZ21h
aWwuY29tPgpEYXRlOiBNb24sIDE0IEZlYiAyMDIyIDAxOjA4OjAyICswOTAwClN1YmplY3Q6
IFtQQVRDSCB2Ml0gbXRkOiBjZmlfY21kc2V0XzAwMDI6IFVzZSBjaGlwX3JlYWR5KCkgZm9y
IHdyaXRlIG9uCiBTMjlHTDA2NE4KClRoZSByZWdyZXNzaW9uIGlzc3VlIGhhcyBiZWVuIGNh
dXNlZCBvbiBTMjlHTDA2NE4gYW5kIHJlcG9ydGVkIGl0LgpBbHNvIHRoZSBjaGFuZ2UgbWVu
dGlvbmVkIGlzIHRvIHVzZSBjaGlwX2dvb2QoKSBmb3IgYnVmZmVyZWQgd3JpdGUuClNvIGRp
c2FibGUgdGhlIGNoYW5nZSBvbiBTMjlHTDA2NE4gYW5kIHVzZSBjaGlwX3JlYWR5KCkgYXMg
YmVmb3JlLgoKRml4ZXM6IGRmZWFlMTA3MzU4MygibXRkOiBjZmlfY21kc2V0XzAwMDI6IENo
YW5nZSB3cml0ZSBidWZmZXIgdG8gY2hlY2sgY29ycmVjdCB2YWx1ZSIpClNpZ25lZC1vZmYt
Ynk6IFRva3Vub3JpIElrZWdhbWkgPGlrZWdhbWkudEBnbWFpbC5jb20+CkNjOiBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgpDYzogUmljaGFyZCBXZWluYmVy
Z2VyIDxyaWNoYXJkQG5vZC5hdD4KQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hy
QHRpLmNvbT4KQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvYjY4N2My
NTktNjQxMy0yNmM5LWQ0YzktYjNhZmE2OWVhMTI0QHBlbmd1dHJvbml4LmRlLwotLS0KIGRy
aXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jIHwgODkgKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCA0MiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0
XzAwMDIuYyBiL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCmluZGV4IGE3
NjExMzRmZDNiZS4uNWUxNGI2MGU4NjM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9jaGlw
cy9jZmlfY21kc2V0XzAwMDIuYworKysgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0
XzAwMDIuYwpAQCAtNDgsNiArNDgsNyBAQAogI2RlZmluZSBTU1Q0OUxGMDQwQgkJMHgwMDUw
CiAjZGVmaW5lIFNTVDQ5TEYwMDhBCQkweDAwNWEKICNkZWZpbmUgQVQ0OUJWNjQxNgkJMHgw
MGQ2CisjZGVmaW5lIFMyOUdMMDY0Tl9NTjEyCQkweDBjMDEKIAogLyoKICAqIFN0YXR1cyBS
ZWdpc3RlciBiaXQgZGVzY3JpcHRpb24uIFVzZWQgYnkgZmxhc2ggZGV2aWNlcyB0aGF0IGRv
bid0CkBAIC00NjIsNyArNDYzLDcgQEAgc3RhdGljIHN0cnVjdCBjZmlfZml4dXAgY2ZpX2Zp
eHVwX3RhYmxlW10gPSB7CiAJeyBDRklfTUZSX0FNRCwgMHgwMDU2LCBmaXh1cF91c2Vfc2Vj
c2kgfSwKIAl7IENGSV9NRlJfQU1ELCAweDAwNUMsIGZpeHVwX3VzZV9zZWNzaSB9LAogCXsg
Q0ZJX01GUl9BTUQsIDB4MDA1RiwgZml4dXBfdXNlX3NlY3NpIH0sCi0JeyBDRklfTUZSX0FN
RCwgMHgwYzAxLCBmaXh1cF9zMjlnbDA2NG5fc2VjdG9ycyB9LAorCXsgQ0ZJX01GUl9BTUQs
IFMyOUdMMDY0Tl9NTjEyLCBmaXh1cF9zMjlnbDA2NG5fc2VjdG9ycyB9LAogCXsgQ0ZJX01G
Ul9BTUQsIDB4MTMwMSwgZml4dXBfczI5Z2wwNjRuX3NlY3RvcnMgfSwKIAl7IENGSV9NRlJf
QU1ELCAweDFhMDAsIGZpeHVwX3MyOWdsMDMybl9zZWN0b3JzIH0sCiAJeyBDRklfTUZSX0FN
RCwgMHgxYTAxLCBmaXh1cF9zMjlnbDAzMm5fc2VjdG9ycyB9LApAQCAtODAxLDIyICs4MDIs
MTIgQEAgc3RhdGljIHN0cnVjdCBtdGRfaW5mbyAqY2ZpX2FtZHN0ZF9zZXR1cChzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCkKIAlyZXR1cm4gTlVMTDsKIH0KIAotLyoKLSAqIFJldHVybiB0cnVl
IGlmIHRoZSBjaGlwIGlzIHJlYWR5LgotICoKLSAqIFJlYWR5IGlzIG9uZSBvZjogcmVhZCBt
b2RlLCBxdWVyeSBtb2RlLCBlcmFzZS1zdXNwZW5kLXJlYWQgbW9kZSAoaW4gYW55Ci0gKiBu
b24tc3VzcGVuZGVkIHNlY3RvcikgYW5kIGlzIGluZGljYXRlZCBieSBubyB0b2dnbGUgYml0
cyB0b2dnbGluZy4KLSAqCi0gKiBOb3RlIHRoYXQgYW55dGhpbmcgbW9yZSBjb21wbGljYXRl
ZCB0aGFuIGNoZWNraW5nIGlmIG5vIGJpdHMgYXJlIHRvZ2dsaW5nCi0gKiAoaW5jbHVkaW5n
IGNoZWNraW5nIERRNSBmb3IgYW4gZXJyb3Igc3RhdHVzKSBpcyB0cmlja3kgdG8gZ2V0IHdv
cmtpbmcKLSAqIGNvcnJlY3RseSBhbmQgaXMgdGhlcmVmb3JlIG5vdCBkb25lCShwYXJ0aWN1
bGFybHkgd2l0aCBpbnRlcmxlYXZlZCBjaGlwcwotICogYXMgZWFjaCBjaGlwIG11c3QgYmUg
Y2hlY2tlZCBpbmRlcGVuZGVudGx5IG9mIHRoZSBvdGhlcnMpLgotICovCi1zdGF0aWMgaW50
IF9feGlwcmFtIGNoaXBfcmVhZHkoc3RydWN0IG1hcF9pbmZvICptYXAsIHN0cnVjdCBmbGNo
aXAgKmNoaXAsCi0JCQkgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyKQorc3RhdGljIGludCBf
X3hpcHJhbSBjaGlwX2NoZWNrKHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlw
ICpjaGlwLAorCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciwgbWFwX3dvcmQgKmV4cGVj
dGVkKQogewogCXN0cnVjdCBjZmlfcHJpdmF0ZSAqY2ZpID0gbWFwLT5mbGRydl9wcml2Owot
CW1hcF93b3JkIGQsIHQ7CisJbWFwX3dvcmQgb2xkZCwgY3VyZDsKKwlpbnQgcmV0OwogCiAJ
aWYgKGNmaV91c2Vfc3RhdHVzX3JlZyhjZmkpKSB7CiAJCW1hcF93b3JkIHJlYWR5ID0gQ01E
KENGSV9TUl9EUkIpOwpAQCAtODI2LDE3ICs4MTcsMzUgQEAgc3RhdGljIGludCBfX3hpcHJh
bSBjaGlwX3JlYWR5KHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlw
LAogCQkgKi8KIAkJY2ZpX3NlbmRfZ2VuX2NtZCgweDcwLCBjZmktPmFkZHJfdW5sb2NrMSwg
Y2hpcC0+c3RhcnQsIG1hcCwgY2ZpLAogCQkJCSBjZmktPmRldmljZV90eXBlLCBOVUxMKTsK
LQkJZCA9IG1hcF9yZWFkKG1hcCwgYWRkcik7CisJCWN1cmQgPSBtYXBfcmVhZChtYXAsIGFk
ZHIpOwogCi0JCXJldHVybiBtYXBfd29yZF9hbmRlcXVhbChtYXAsIGQsIHJlYWR5LCByZWFk
eSk7CisJCXJldHVybiBtYXBfd29yZF9hbmRlcXVhbChtYXAsIGN1cmQsIHJlYWR5LCByZWFk
eSk7CiAJfQogCi0JZCA9IG1hcF9yZWFkKG1hcCwgYWRkcik7Ci0JdCA9IG1hcF9yZWFkKG1h
cCwgYWRkcik7CisJb2xkZCA9IG1hcF9yZWFkKG1hcCwgYWRkcik7CisJY3VyZCA9IG1hcF9y
ZWFkKG1hcCwgYWRkcik7CisKKwlyZXQgPSBtYXBfd29yZF9lcXVhbChtYXAsIG9sZGQsIGN1
cmQpOwogCi0JcmV0dXJuIG1hcF93b3JkX2VxdWFsKG1hcCwgZCwgdCk7CisJaWYgKCFyZXQg
fHwgIWV4cGVjdGVkKQorCQlyZXR1cm4gcmV0OworCisJcmV0dXJuIG1hcF93b3JkX2VxdWFs
KG1hcCwgY3VyZCwgKmV4cGVjdGVkKTsKIH0KIAorLyoKKyAqIFJldHVybiB0cnVlIGlmIHRo
ZSBjaGlwIGlzIHJlYWR5LgorICoKKyAqIFJlYWR5IGlzIG9uZSBvZjogcmVhZCBtb2RlLCBx
dWVyeSBtb2RlLCBlcmFzZS1zdXNwZW5kLXJlYWQgbW9kZSAoaW4gYW55CisgKiBub24tc3Vz
cGVuZGVkIHNlY3RvcikgYW5kIGlzIGluZGljYXRlZCBieSBubyB0b2dnbGUgYml0cyB0b2dn
bGluZy4KKyAqCisgKiBOb3RlIHRoYXQgYW55dGhpbmcgbW9yZSBjb21wbGljYXRlZCB0aGFu
IGNoZWNraW5nIGlmIG5vIGJpdHMgYXJlIHRvZ2dsaW5nCisgKiAoaW5jbHVkaW5nIGNoZWNr
aW5nIERRNSBmb3IgYW4gZXJyb3Igc3RhdHVzKSBpcyB0cmlja3kgdG8gZ2V0IHdvcmtpbmcK
KyAqIGNvcnJlY3RseSBhbmQgaXMgdGhlcmVmb3JlIG5vdCBkb25lCShwYXJ0aWN1bGFybHkg
d2l0aCBpbnRlcmxlYXZlZCBjaGlwcworICogYXMgZWFjaCBjaGlwIG11c3QgYmUgY2hlY2tl
ZCBpbmRlcGVuZGVudGx5IG9mIHRoZSBvdGhlcnMpLgorICovCisjZGVmaW5lIGNoaXBfcmVh
ZHkobWFwLCBjaGlwLCBhZGRyKSBjaGlwX2NoZWNrKG1hcCwgY2hpcCwgYWRkciwgTlVMTCkK
KwogLyoKICAqIFJldHVybiB0cnVlIGlmIHRoZSBjaGlwIGlzIHJlYWR5IGFuZCBoYXMgdGhl
IGNvcnJlY3QgdmFsdWUuCiAgKgpAQCAtODU1LDI4ICs4NjQsMjQgQEAgc3RhdGljIGludCBf
X3hpcHJhbSBjaGlwX3JlYWR5KHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlw
ICpjaGlwLAogc3RhdGljIGludCBfX3hpcHJhbSBjaGlwX2dvb2Qoc3RydWN0IG1hcF9pbmZv
ICptYXAsIHN0cnVjdCBmbGNoaXAgKmNoaXAsCiAJCQkgICAgICB1bnNpZ25lZCBsb25nIGFk
ZHIsIG1hcF93b3JkIGV4cGVjdGVkKQogewotCXN0cnVjdCBjZmlfcHJpdmF0ZSAqY2ZpID0g
bWFwLT5mbGRydl9wcml2OwotCW1hcF93b3JkIG9sZGQsIGN1cmQ7Ci0KLQlpZiAoY2ZpX3Vz
ZV9zdGF0dXNfcmVnKGNmaSkpIHsKLQkJbWFwX3dvcmQgcmVhZHkgPSBDTUQoQ0ZJX1NSX0RS
Qik7CisJcmV0dXJuIGNoaXBfY2hlY2sobWFwLCBjaGlwLCBhZGRyLCAmZXhwZWN0ZWQpOwor
fQogCi0JCS8qCi0JCSAqIEZvciBjaGlwcyB0aGF0IHN1cHBvcnQgc3RhdHVzIHJlZ2lzdGVy
LCBjaGVjayBkZXZpY2UKLQkJICogcmVhZHkgYml0Ci0JCSAqLwotCQljZmlfc2VuZF9nZW5f
Y21kKDB4NzAsIGNmaS0+YWRkcl91bmxvY2sxLCBjaGlwLT5zdGFydCwgbWFwLCBjZmksCi0J
CQkJIGNmaS0+ZGV2aWNlX3R5cGUsIE5VTEwpOwotCQljdXJkID0gbWFwX3JlYWQobWFwLCBh
ZGRyKTsKK3N0YXRpYyBib29sIGNmaV91c2VfY2hpcF9yZWFkeV9mb3Jfd3JpdGUoc3RydWN0
IG1hcF9pbmZvICptYXApCit7CisJc3RydWN0IGNmaV9wcml2YXRlICpjZmkgPSBtYXAtPmZs
ZHJ2X3ByaXY7CiAKLQkJcmV0dXJuIG1hcF93b3JkX2FuZGVxdWFsKG1hcCwgY3VyZCwgcmVh
ZHksIHJlYWR5KTsKLQl9CisJcmV0dXJuIGNmaS0+bWZyID09IENGSV9NRlJfQU1EICYmIGNm
aS0+aWQgPT0gUzI5R0wwNjROX01OMTI7Cit9CiAKLQlvbGRkID0gbWFwX3JlYWQobWFwLCBh
ZGRyKTsKLQljdXJkID0gbWFwX3JlYWQobWFwLCBhZGRyKTsKK3N0YXRpYyBpbnQgX194aXBy
YW0gY2hpcF9nb29kX2Zvcl93cml0ZShzdHJ1Y3QgbWFwX2luZm8gKm1hcCwKKwkJCQkJc3Ry
dWN0IGZsY2hpcCAqY2hpcCwgdW5zaWduZWQgbG9uZyBhZGRyLAorCQkJCQltYXBfd29yZCBl
eHBlY3RlZCkKK3sKKwlpZiAoY2ZpX3VzZV9jaGlwX3JlYWR5X2Zvcl93cml0ZShtYXApKQor
CQlyZXR1cm4gY2hpcF9yZWFkeShtYXAsIGNoaXAsIGFkZHIpOwogCi0JcmV0dXJuCW1hcF93
b3JkX2VxdWFsKG1hcCwgb2xkZCwgY3VyZCkgJiYKLQkJbWFwX3dvcmRfZXF1YWwobWFwLCBj
dXJkLCBleHBlY3RlZCk7CisJcmV0dXJuIGNoaXBfZ29vZChtYXAsIGNoaXAsIGFkZHIsIGV4
cGVjdGVkKTsKIH0KIAogc3RhdGljIGludCBnZXRfY2hpcChzdHJ1Y3QgbWFwX2luZm8gKm1h
cCwgc3RydWN0IGZsY2hpcCAqY2hpcCwgdW5zaWduZWQgbG9uZyBhZHIsIGludCBtb2RlKQpA
QCAtMTY5OSw3ICsxNzA0LDcgQEAgc3RhdGljIGludCBfX3hpcHJhbSBkb193cml0ZV9vbmV3
b3JkX29uY2Uoc3RydWN0IG1hcF9pbmZvICptYXAsCiAJCSAqICJjaGlwX2dvb2QiIHRvIGF2
b2lkIHRoZSBmYWlsdXJlIGR1ZSB0byBzY2hlZHVsaW5nLgogCQkgKi8KIAkJaWYgKHRpbWVf
YWZ0ZXIoamlmZmllcywgdGltZW8pICYmCi0JCSAgICAhY2hpcF9nb29kKG1hcCwgY2hpcCwg
YWRyLCBkYXR1bSkpIHsKKwkJICAgICFjaGlwX2dvb2RfZm9yX3dyaXRlKG1hcCwgY2hpcCwg
YWRyLCBkYXR1bSkpIHsKIAkJCXhpcF9lbmFibGUobWFwLCBjaGlwLCBhZHIpOwogCQkJcHJp
bnRrKEtFUk5fV0FSTklORyAiTVREICVzKCk6IHNvZnR3YXJlIHRpbWVvdXRcbiIsIF9fZnVu
Y19fKTsKIAkJCXhpcF9kaXNhYmxlKG1hcCwgY2hpcCwgYWRyKTsKQEAgLTE3MDcsNyArMTcx
Miw3IEBAIHN0YXRpYyBpbnQgX194aXByYW0gZG9fd3JpdGVfb25ld29yZF9vbmNlKHN0cnVj
dCBtYXBfaW5mbyAqbWFwLAogCQkJYnJlYWs7CiAJCX0KIAotCQlpZiAoY2hpcF9nb29kKG1h
cCwgY2hpcCwgYWRyLCBkYXR1bSkpIHsKKwkJaWYgKGNoaXBfZ29vZF9mb3Jfd3JpdGUobWFw
LCBjaGlwLCBhZHIsIGRhdHVtKSkgewogCQkJaWYgKGNmaV9jaGVja19lcnJfc3RhdHVzKG1h
cCwgY2hpcCwgYWRyKSkKIAkJCQlyZXQgPSAtRUlPOwogCQkJYnJlYWs7CkBAIC0xOTc5LDE0
ICsxOTg0LDE0IEBAIHN0YXRpYyBpbnQgX194aXByYW0gZG9fd3JpdGVfYnVmZmVyX3dhaXQo
c3RydWN0IG1hcF9pbmZvICptYXAsCiAJCSAqICJjaGlwX2dvb2QiIHRvIGF2b2lkIHRoZSBm
YWlsdXJlIGR1ZSB0byBzY2hlZHVsaW5nLgogCQkgKi8KIAkJaWYgKHRpbWVfYWZ0ZXIoamlm
ZmllcywgdGltZW8pICYmCi0JCSAgICAhY2hpcF9nb29kKG1hcCwgY2hpcCwgYWRyLCBkYXR1
bSkpIHsKKwkJICAgICFjaGlwX2dvb2RfZm9yX3dyaXRlKG1hcCwgY2hpcCwgYWRyLCBkYXR1
bSkpIHsKIAkJCXByX2VycigiTVREICVzKCk6IHNvZnR3YXJlIHRpbWVvdXQsIGFkZHJlc3M6
MHglLjhseC5cbiIsCiAJCQkgICAgICAgX19mdW5jX18sIGFkcik7CiAJCQlyZXQgPSAtRUlP
OwogCQkJYnJlYWs7CiAJCX0KIAotCQlpZiAoY2hpcF9nb29kKG1hcCwgY2hpcCwgYWRyLCBk
YXR1bSkpIHsKKwkJaWYgKGNoaXBfZ29vZF9mb3Jfd3JpdGUobWFwLCBjaGlwLCBhZHIsIGRh
dHVtKSkgewogCQkJaWYgKGNmaV9jaGVja19lcnJfc3RhdHVzKG1hcCwgY2hpcCwgYWRyKSkK
IAkJCQlyZXQgPSAtRUlPOwogCQkJYnJlYWs7Ci0tIAoyLjMyLjAKCg==

--------------K91juOuLpSSbXSC0vYcfI0J1--
