Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF663B919
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 18:11:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MynK1SVYzDqHW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 02:11:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::244; helo=mail-oi1-x244.google.com;
 envelope-from=larry.finger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r6Jmcvz2"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Myl66NzczDqCw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 02:09:54 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id q186so6662147oia.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 09:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=o6kJfIIxf3+CLuDt60IWBugOj7DYo2cJ4pIJXDINxcQ=;
 b=r6Jmcvz2cFKkJ6CTqjBzhvxeOFJ4KVWyE818wZ4KwtCLKljAY2IT2vM3t80hoTtMbY
 8oh9zbpHVIRODOH06ZuEazfBGO/dChhf4nzkxDB29AToHowI5FXuk/8/t5MiKvp8FM4q
 nGzHeF2WXRojWEfEGs/SvA/weGEDneodiygsuHCKyq4DfLkoNZYpBZTSe5LOFOxCroW0
 hSlhJUJCvJkmm5emllO+K7uZd038eQA7XW3eIu6C/+t0y12awHExlcLw9xJ45AmNTT5J
 IRm+D5RS6g+VddIPA3ujJZacxH6pH0Loi9NgbqrhjLiBzJlyt6zMwhR9qohatonGnQSx
 lkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=o6kJfIIxf3+CLuDt60IWBugOj7DYo2cJ4pIJXDINxcQ=;
 b=dkU19b/zi4I1ilP4D9r1MS38CrA6LAsOjHyfl1MDqSzCC/zgLDWJMvXWwDFcj8QwUY
 QzutjmiDFy0R0RrB/bZ9WyBbLIPcp/6mvN0pkQPpjNddPt9NRYDCRlhj32sK/CfDR317
 YctIsn1tNoeHWfGo7y1E7NHZxifnX1lkf5m/Wardic6AUiMZqlLE8kiItOgURIl1s+m8
 NBVk5GXuosbh96rNSllQbal7l9PMoauYWt+HaEr4tKpVVfhOyHvtPEVCXd9Tc2vqjAuc
 4u2x5wvZ158JE/X6zCDync64qtjYrpWQFn79JJaQDihvbV8N0xqZQCt/Uj4OOXKtLaMl
 gVxQ==
X-Gm-Message-State: APjAAAWWyr5qszNo8/wfBHBleUAkjLPW5/mzeKTiblk27pzLrNheqh7S
 nlU/SKiztPIRqLM2p/9yFLqLDhOZ
X-Google-Smtp-Source: APXvYqyPyr0j26tGMkWhtV43A0upDXJqDNFFrti25Vh1FAvy5t/Ay00kZncuJYv/jTolGck8yI/ccA==
X-Received: by 2002:aca:50c6:: with SMTP id e189mr12465946oib.63.1560182991581; 
 Mon, 10 Jun 2019 09:09:51 -0700 (PDT)
Received: from [192.168.1.112] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id l12sm416626otp.74.2019.06.10.09.09.48
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 09:09:49 -0700 (PDT)
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
To: Christoph Hellwig <hch@lst.de>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <20190607172902.GA8183@lst.de>
 <30000803-3772-3edf-f4a9-55122d504f3f@lwfinger.net>
 <20190610081825.GA16534@lst.de>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <153c13f5-a829-1eab-a3c5-fecfb84127ff@lwfinger.net>
Date: Mon, 10 Jun 2019 11:09:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610081825.GA16534@lst.de>
Content-Type: multipart/mixed; boundary="------------9E0BA6B24CBFDA3D78DB4932"
Content-Language: en-US
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------9E0BA6B24CBFDA3D78DB4932
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/19 3:18 AM, Christoph Hellwig wrote:
> On Sat, Jun 08, 2019 at 04:52:24PM -0500, Larry Finger wrote:
>> On 6/7/19 12:29 PM, Christoph Hellwig wrote:
>>> I don't think we should work around this in the driver, we need to fix
>>> it in the core.  I'm curious why my previous patch didn't work.  Can
>>> you throw in a few printks what failed?  I.e. did dma_direct_supported
>>> return false?  Did the actual allocation fail?
>>
>> Routine dma_direct_supported() returns true.
>>
>> The failure is in routine dma_set_mask() in the following if test:
>>
>>          if (!dev->dma_mask || !dma_supported(dev, mask))
>>                  return -EIO;
>>
>> For b43legacy, dev->dma_mask is 0xc265684800000000.
>>      dma_supported(dev, mask) is 0xc08b000000000000, mask is 0x3fffffff, and
>> the routine returns -EIO.
>>
>> For b43,       dev->dma_mask is 0xc265684800000001,
>>      dma_supported(dev, mask) is 0xc08b000000000000, mask is 0x77777777, and
>> the routine returns 0.
> 
> I don't fully understand what values the above map to.  Can you send
> me your actual debugging patch as well?

I do not understand why the if statement returns true as neither of the values 
is zero. After seeing the x86 output shown below, I also do not understand all 
the trailing zeros.

My entire patch is attached. That output came from this section:

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index f7afdad..ba2489d 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -317,9 +317,12 @@ int dma_supported(struct device *dev, u64 mask)

  int dma_set_mask(struct device *dev, u64 mask)
  {
+       pr_info("mask 0x%llx, dma_mask 0x%llx, dma_supported 0x%llx\n", mask, 
dev->dma_mask,
+               dma_supported(dev, mask));
         if (!dev->dma_mask || !dma_supported(dev, mask))
                 return -EIO;

+       pr_info("Continuing in dma_set_mask()\n");
         arch_dma_set_mask(dev, mask);
         dma_check_mask(dev, mask);
         *dev->dma_mask = mask;

On a 32-bit x86 computer with 1GB of RAM, that same output was

For b43legacy, dev->dma_mask is 0x01f4029044.
     dma_supported(dev, mask) is 0x1ef37f7000, mask is 0x3fffffff, and
the routine returns 0. 30-bit DMA works.

For b43,       dev->dma_mask is 0x01f4029044,
     dma_supported(dev, mask) is 0x1ef37f7000, mask is 0xffffffff, and
  the routine also returns 0. This card supports 32-bit DMA.

Larry

--------------9E0BA6B24CBFDA3D78DB4932
Content-Type: text/plain; charset=UTF-8;
 name="b43legacy_tests"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="b43legacy_tests"

ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdlLmggYi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vcGFnZS5oCmluZGV4IGI4Mjg2YTIuLjdhMzY3Y2UgMTAwNjQ0
Ci0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdlLmgKKysrIGIvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL3BhZ2UuaApAQCAtMzE5LDYgKzMxOSwxMCBAQCBleHRlcm4gdm9p
ZCBjb3B5X3VzZXJfcGFnZSh2b2lkICp0bywgdm9pZCAqZnJvbSwgdW5zaWduZWQgbG9uZyB2
YWRkciwKICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KICNpbmNsdWRlIDxhc20vc2xpY2Uu
aD4KIAorI2lmIDEgLyogWFhYOiBwbWFjPyAgZHluYW1pYyBkaXNjb3Zlcnk/ICovCisjZGVm
aW5lIEFSQ0hfWk9ORV9ETUFfQklUUyAzMAorI2Vsc2UKICNkZWZpbmUgQVJDSF9aT05FX0RN
QV9CSVRTIDMxCisjZW5kaWYKIAogI2VuZGlmIC8qIF9BU01fUE9XRVJQQ19QQUdFX0ggKi8K
ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvZG1hLWlvbW11LmMgYi9hcmNoL3Bv
d2VycGMva2VybmVsL2RtYS1pb21tdS5jCmluZGV4IDA5MjMxZWYuLjc2MWQ5NTEgMTAwNjQ0
Ci0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvZG1hLWlvbW11LmMKKysrIGIvYXJjaC9wb3dl
cnBjL2tlcm5lbC9kbWEtaW9tbXUuYwpAQCAtMjAsNiArMjAsOCBAQAogICovCiBzdGF0aWMg
aW5saW5lIGJvb2wgZG1hX2lvbW11X2FsbG9jX2J5cGFzcyhzdHJ1Y3QgZGV2aWNlICpkZXYp
CiB7CisJcHJfaW5mbygiZGV2LT5hcmNoZGF0YS5pb21tdV9ieXBhc3MgJWQsICFpb21tdV9m
aXhlZF9pc193ZWFrICVkXG4iLAorCQlkZXYtPmFyY2hkYXRhLmlvbW11X2J5cGFzcywgIWlv
bW11X2ZpeGVkX2lzX3dlYWspCQkKIAlyZXR1cm4gZGV2LT5hcmNoZGF0YS5pb21tdV9ieXBh
c3MgJiYgIWlvbW11X2ZpeGVkX2lzX3dlYWsgJiYKIAkJZG1hX2RpcmVjdF9zdXBwb3J0ZWQo
ZGV2LCBkZXYtPmNvaGVyZW50X2RtYV9tYXNrKTsKIH0KQEAgLTI3LDYgKzI5LDggQEAgc3Rh
dGljIGlubGluZSBib29sIGRtYV9pb21tdV9hbGxvY19ieXBhc3Moc3RydWN0IGRldmljZSAq
ZGV2KQogc3RhdGljIGlubGluZSBib29sIGRtYV9pb21tdV9tYXBfYnlwYXNzKHN0cnVjdCBk
ZXZpY2UgKmRldiwKIAkJdW5zaWduZWQgbG9uZyBhdHRycykKIHsKKwlwcl9pbmZvKCIoYXR0
cnMgJiBETUFfQVRUUl9XRUFLX09SREVSSU5HKSAlZFxuIiwKKwkJKGF0dHJzICYgRE1BX0FU
VFJfV0VBS19PUkRFUklORykpOwogCXJldHVybiBkZXYtPmFyY2hkYXRhLmlvbW11X2J5cGFz
cyAmJgogCQkoIWlvbW11X2ZpeGVkX2lzX3dlYWsgfHwgKGF0dHJzICYgRE1BX0FUVFJfV0VB
S19PUkRFUklORykpOwogfQpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL21lbS5jIGIv
YXJjaC9wb3dlcnBjL21tL21lbS5jCmluZGV4IGNiYTI5MTMuLjI1NDBkM2IgMTAwNjQ0Ci0t
LSBhL2FyY2gvcG93ZXJwYy9tbS9tZW0uYworKysgYi9hcmNoL3Bvd2VycGMvbW0vbWVtLmMK
QEAgLTI0OCw3ICsyNDgsOCBAQCB2b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQogCSAg
ICAgICAobG9uZyBpbnQpKCh0b3Bfb2ZfcmFtIC0gdG90YWxfcmFtKSA+PiAyMCkpOwogCiAj
aWZkZWYgQ09ORklHX1pPTkVfRE1BCi0JbWF4X3pvbmVfcGZuc1taT05FX0RNQV0JPSBtaW4o
bWF4X2xvd19wZm4sIDB4N2ZmZmZmZmZVTCA+PiBQQUdFX1NISUZUKTsKKwltYXhfem9uZV9w
Zm5zW1pPTkVfRE1BXQk9IG1pbihtYXhfbG93X3BmbiwKKwkJCSgoMVVMIDw8IEFSQ0hfWk9O
RV9ETUFfQklUUykgLSAxKSA+PiBQQUdFX1NISUZUKTsKICNlbmRpZgogCW1heF96b25lX3Bm
bnNbWk9ORV9OT1JNQUxdID0gbWF4X2xvd19wZm47CiAjaWZkZWYgQ09ORklHX0hJR0hNRU0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2Jyb2FkY29tL2I0My9kbWEuYyBi
L2RyaXZlcnMvbmV0L3dpcmVsZXNzL2Jyb2FkY29tL2I0My9kbWEuYwppbmRleCA4MDY0MDZh
Li5lMDI3MGRhIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9icm9hZGNvbS9i
NDMvZG1hLmMKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYnJvYWRjb20vYjQzL2RtYS5j
CkBAIC0xMDUzLDYgKzEwNTMsNyBAQCBzdGF0aWMgaW50IGI0M19kbWFfc2V0X21hc2soc3Ry
dWN0IGI0M193bGRldiAqZGV2LCB1NjQgbWFzaykKIAkgKiBsb3dlciBtYXNrLCBhcyB3ZSBj
YW4gYWx3YXlzIGFsc28gc3VwcG9ydCBhIGxvd2VyIG9uZS4gKi8KIAl3aGlsZSAoMSkgewog
CQllcnIgPSBkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KGRldi0+ZGV2LT5kbWFfZGV2LCBt
YXNrKTsKKwkJcHJfaW5mbygiZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudCAlZCwgbWFzayAw
eCVsbHhcbiIsIGVyciwgbWFzayk7CiAJCWlmICghZXJyKQogCQkJYnJlYWs7CiAJCWlmICht
YXNrID09IERNQV9CSVRfTUFTSyg2NCkpIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dp
cmVsZXNzL2Jyb2FkY29tL2I0M2xlZ2FjeS9kbWEuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNz
L2Jyb2FkY29tL2I0M2xlZ2FjeS9kbWEuYwppbmRleCAxY2MyNWY0Li5jNjI1ZmZjIDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9icm9hZGNvbS9iNDNsZWdhY3kvZG1hLmMK
KysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYnJvYWRjb20vYjQzbGVnYWN5L2RtYS5jCkBA
IC03OTQsNiArNzk0LDcgQEAgc3RhdGljIGludCBiNDNsZWdhY3lfZG1hX3NldF9tYXNrKHN0
cnVjdCBiNDNsZWdhY3lfd2xkZXYgKmRldiwgdTY0IG1hc2spCiAJICogbG93ZXIgbWFzaywg
YXMgd2UgY2FuIGFsd2F5cyBhbHNvIHN1cHBvcnQgYSBsb3dlciBvbmUuICovCiAJd2hpbGUg
KDEpIHsKIAkJZXJyID0gZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudChkZXYtPmRldi0+ZG1h
X2RldiwgbWFzayk7CisJCXByX2luZm8oImRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQgJWQs
IG1hc2sgMHglbGx4XG4iLCBlcnIsIG1hc2spOwogCQlpZiAoIWVycikKIAkJCWJyZWFrOwog
CQlpZiAobWFzayA9PSBETUFfQklUX01BU0soNjQpKSB7CmRpZmYgLS1naXQgYS9rZXJuZWwv
ZG1hL2RpcmVjdC5jIGIva2VybmVsL2RtYS9kaXJlY3QuYwppbmRleCAyYzI3NzJlLi5iNzE2
ZTYyIDEwMDY0NAotLS0gYS9rZXJuZWwvZG1hL2RpcmVjdC5jCisrKyBiL2tlcm5lbC9kbWEv
ZGlyZWN0LmMKQEAgLTM5MSw2ICszOTEsOCBAQCBpbnQgZG1hX2RpcmVjdF9zdXBwb3J0ZWQo
c3RydWN0IGRldmljZSAqZGV2LCB1NjQgbWFzaykKIAkgKiB1c2UgX19waHlzX3RvX2RtYSgp
IGhlcmUgc28gdGhhdCB0aGUgU01FIGVuY3J5cHRpb24gbWFzayBpc24ndAogCSAqIHBhcnQg
b2YgdGhlIGNoZWNrLgogCSAqLworCXByX2luZm8oIm1pbl9tYXNrIDB4JXguIG1heF9wZm4g
MHgleCwgX19waHlzX3RvX2RtYSAweCV4LCBtYXNrIDB4JXhcbiIsIG1pbl9tYXNrLAorCQlt
YXhfcGZuLCBfX3BoeXNfdG9fZG1hKGRldiwgbWluX21hc2spLCBtYXNrKTsKIAlyZXR1cm4g
bWFzayA+PSBfX3BoeXNfdG9fZG1hKGRldiwgbWluX21hc2spOwogfQogCmRpZmYgLS1naXQg
YS9rZXJuZWwvZG1hL21hcHBpbmcuYyBiL2tlcm5lbC9kbWEvbWFwcGluZy5jCmluZGV4IGY3
YWZkYWQuLmJhMjQ4OWQgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9kbWEvbWFwcGluZy5jCisrKyBi
L2tlcm5lbC9kbWEvbWFwcGluZy5jCkBAIC0zMTcsOSArMzE3LDEyIEBAIGludCBkbWFfc3Vw
cG9ydGVkKHN0cnVjdCBkZXZpY2UgKmRldiwgdTY0IG1hc2spCiAKIGludCBkbWFfc2V0X21h
c2soc3RydWN0IGRldmljZSAqZGV2LCB1NjQgbWFzaykKIHsKKwlwcl9pbmZvKCJtYXNrIDB4
JWxseCwgZG1hX21hc2sgMHglbGx4LCBkbWFfc3VwcG9ydGVkIDB4JWxseFxuIiwgbWFzaywg
ZGV2LT5kbWFfbWFzaywKKwkJZG1hX3N1cHBvcnRlZChkZXYsIG1hc2spKTsKIAlpZiAoIWRl
di0+ZG1hX21hc2sgfHwgIWRtYV9zdXBwb3J0ZWQoZGV2LCBtYXNrKSkKIAkJcmV0dXJuIC1F
SU87CiAKKwlwcl9pbmZvKCJDb250aW51aW5nIGluIGRtYV9zZXRfbWFzaygpXG4iKTsKIAlh
cmNoX2RtYV9zZXRfbWFzayhkZXYsIG1hc2spOwogCWRtYV9jaGVja19tYXNrKGRldiwgbWFz
ayk7CiAJKmRldi0+ZG1hX21hc2sgPSBtYXNrOwo=
--------------9E0BA6B24CBFDA3D78DB4932--
