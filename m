Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BFF8FC214
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 05:05:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gg1qX+A+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvC4R4f7Jz3bnL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 13:04:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gg1qX+A+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvC3k20yxz30T1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 13:04:17 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a63359aaaa6so802255366b.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 20:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717556646; x=1718161446; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UP5Y9jEQGfZwA2FjZqhCdBAPb8KCPJQ0fFNkt2OocLA=;
        b=gg1qX+A+gI0sx7oLvIFGffoXPjW7x+WuQLoJFJg9mj0MWopbHf4sSpU2oWgN2Em/9y
         UDg6d4rGr04GcWeQ/yts0kuXgNjp6Q7CuU7efoRUV5f9wMewq3v44PC+ORPmtpuvpr8M
         L34cJZISfli74bvcB+FbKSoeADR72gSaV7Y/gBIeVMkQIOvwuKguT8+jC+SRw6KCFoYl
         xv8UyW/3gdxHUe4Z2fb2uS3OH+hBPz/HERAtbA30M4XOEI/MPbe+PnvPwC2dvPot53ft
         a2SqWg+FlT84Hof44Wo7iSXLUFrYgG03HHQWPnhWvunkXCm5NHw8/wD4lnAqNusBr3IY
         wafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717556646; x=1718161446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UP5Y9jEQGfZwA2FjZqhCdBAPb8KCPJQ0fFNkt2OocLA=;
        b=ErFdfok5io8KcfwFFbDa9XIFPpUi/A3eEH7LgRqOxMsrbSJjOF4Mzk0DL/qdMe4hmq
         GCTljWWNVwW9asYSES07qTkkLlS8fx+jXI6c45cULSC+T6s1XQ0+RZdVoa90QVxPlAWf
         bt3qxZyfbRBVNAnwfgZxiKyxOeLVLbMtaSxQYy27rWWNJRJX6cY/sv76PRNTiMKZ4tea
         uREJg2CLP8Lu0f84EuFYQNPvtB8alsPakEDu40cJr6WAw2An8NYGhnjQqpgCjthEHLGr
         WmCJ5HzxZEba4GScTCdGaTApF8MA21JjjjNCeAfdEZM6UVX21mfdDAbGDZY70nuz8e6D
         Tfvg==
X-Forwarded-Encrypted: i=1; AJvYcCUNj3A68xXv08/utW0/OOlXC6iaDBbJFrMqmhrt1FlZGGwnPikcPGPS2zZr4bbe1o1Pf41ZYlMLmzvGuKZRfZjZ8Q1h10heTdiVprOS9Q==
X-Gm-Message-State: AOJu0YyPtIzsvfZZR8K2X7b6McmoLZT5aPFkFk5HfgtoOzeLi1wz6rWt
	dARziX9KWT9uE+Wtz5lRPqOpze+sTaiSiglWBLiqyVaQ1pOEwNDPOmDlDBAYg+XnuoyGE4bNegZ
	5fiTZXTADWcnT34nj2Owzmj2do+qI70Z6LPE2
X-Google-Smtp-Source: AGHT+IHLH2L6e5+a3o6QycZ9mGWF+toqbi7CwjPpbmZ5QFg26qSMA5glfHf5s69FDa48hkQ2qF3qMFXy5Sd7kK3HKh4=
X-Received: by 2002:a17:906:1c11:b0:a63:4e5a:a240 with SMTP id
 a640c23a62f3a-a699f34a8ecmr72306266b.6.1717556646011; Tue, 04 Jun 2024
 20:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <20240602200332.3e531ff1@yea> <20240604001304.5420284f@yea>
 <CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com>
 <20240604134458.3ae4396a@yea> <CAJD7tkYjJJGthQ_8NukGw6Q9EYbLA=8sAH_7=B90KXEL6HWdSw@mail.gmail.com>
 <CAOUHufa0Fpj6SjNgB-z0n5Jg63q1ewkbOAU65forpDwQVs45qg@mail.gmail.com>
 <CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com>
 <CAOUHufb6zXr14Wm3T-4-OJh7iAq+vzDKwVYfHLhMMt96SpiZXg@mail.gmail.com>
 <CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com> <20240604231019.18e2f373@yea>
In-Reply-To: <20240604231019.18e2f373@yea>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 4 Jun 2024 20:03:27 -0700
Message-ID: <CAJD7tkYq5u7B+0UH2XKpeWJnUxoO2kJ1_XZ2JOgYpyNEVR7u0g@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Erhard Furtner <erhard_f@mailbox.org>
Content-Type: multipart/mixed; boundary="000000000000c4f0d6061a1bd166"
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
Cc: Nhat Pham <nphamcs@gmail.com>, Yu Zhao <yuzhao@google.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Chengming Zhou <chengming.zhou@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000c4f0d6061a1bd166
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 2:10=E2=80=AFPM Erhard Furtner <erhard_f@mailbox.org=
> wrote:
>
> On Tue, 4 Jun 2024 11:01:39 -0700
> Yosry Ahmed <yosryahmed@google.com> wrote:
>
> > How many CPUs does this machine have? I am wondering if 32 can be an
> > overkill for small machines, perhaps the number of pools should be
> > max(nr_cpus, 32)?
>
> This PowerMac G4 DP got 2 CPUs. Not much for a desktop machine by todays =
standards but some SoCs have less. ;)
>
>  # lscpu
> Architecture:          ppc
>   CPU op-mode(s):      32-bit
>   Byte Order:          Big Endian
> CPU(s):                2
>   On-line CPU(s) list: 0,1
> Model name:            7455, altivec supported
>   Model:               3.3 (pvr 8001 0303)
>   Thread(s) per core:  1
>   Core(s) per socket:  1
>   Socket(s):           2
>   BogoMIPS:            83.78
> Caches (sum of all):
>   L1d:                 64 KiB (2 instances)
>   L1i:                 64 KiB (2 instances)
>   L2:                  512 KiB (2 instances)
>   L3:                  4 MiB (2 instances)
>
> Regards,
> Erhard

Could you check if the attached patch helps? It basically changes the
number of zpools from 32 to min(32, nr_cpus).

--000000000000c4f0d6061a1bd166
Content-Type: application/octet-stream; 
	name="0001-mm-zswap-do-not-scale-the-number-of-zpools-unnecessa.patch"
Content-Disposition: attachment; 
	filename="0001-mm-zswap-do-not-scale-the-number-of-zpools-unnecessa.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lx18usbm0>
X-Attachment-Id: f_lx18usbm0

RnJvbSBlYjJiYWY2ZjM0OTc5MzZlYzU2ZmUxN2UyMmFmNWI1YWRkNjI0MzcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZb3NyeSBBaG1lZCA8eW9zcnlhaG1lZEBnb29nbGUuY29tPgpE
YXRlOiBXZWQsIDUgSnVuIDIwMjQgMDI6NTg6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBtbTog
enN3YXA6IGRvIG5vdCBzY2FsZSB0aGUgbnVtYmVyIG9mIHpwb29scyB1bm5lY2Vzc2FyaWx5Cgpa
c3dhcCBhbGxvY2F0ZXMgc2V2ZXJhbCB6cG9vbHMgcGVyIHpzd2FwIHBvb2wgZm9yIHNjYWxhYmls
aXR5LiBJdApjdXJyZW50bHkgYWxsb2NhdGVzIDMyIHpwb29scywgYW4gZW1waXJpY2FsbHkgZGV0
ZXJtaW5lZCBtYWdpYyBudW1iZXIuCgpGb3Igc21hbGwgbWFjaGluZXMgdGhhdCBoYXMgbGVzcyB0
aGFuIDMyIENQVXMsIHRoaXMgZG9lc24ndCBtYWtlIG11Y2gKc2Vuc2UuIEFsbG9jYXRpbmcgbW9y
ZSB6cG9vbHMgdGhhbiBDUFVzIHdpbGwgbm90IHNpZ25pZmljYW50bHkgaW5jcmVhc2UKc2NhbGFi
aWxpdHksIGJ1dCBpdCBtYXkgaW5jcmVhc2UgaW50ZXJuYWwgZnJhZ21lbnRhdGlvbiBkdWUgdG8g
c3ByZWFkaW5nCm9mIGNvbXByZXNzZWQgcGFnZXMgYW1vbmcgZGlmZmVyZW50IHpwb29scy4KCmRl
dGVybWluZWQgYXQgYm9vdCBhcyB0aGUgc21hbGxlciBvZiAzMiBhbmQgdGhlIG51bWJlciBvZiBD
UFVzLgoKU2lnbmVkLW9mZi1ieTogWW9zcnkgQWhtZWQgPHlvc3J5YWhtZWRAZ29vZ2xlLmNvbT4K
LS0tCiBtbS96c3dhcC5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL21tL3pzd2FwLmMgYi9tbS96c3dhcC5jCmluZGV4IGE1MGUyOTg2Y2QyZmEuLjljNGE2
ZDMwOWIyM2MgMTAwNjQ0Ci0tLSBhL21tL3pzd2FwLmMKKysrIGIvbW0venN3YXAuYwpAQCAtMTIz
LDggKzEyMyw4IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgenN3YXBfYWNjZXB0X3Rocl9wZXJjZW50
ID0gOTA7IC8qIG9mIG1heCBwb29sIHNpemUgKi8KIG1vZHVsZV9wYXJhbV9uYW1lZChhY2NlcHRf
dGhyZXNob2xkX3BlcmNlbnQsIHpzd2FwX2FjY2VwdF90aHJfcGVyY2VudCwKIAkJICAgdWludCwg
MDY0NCk7CiAKLS8qIE51bWJlciBvZiB6cG9vbHMgaW4genN3YXBfcG9vbCAoZW1waXJpY2FsbHkg
ZGV0ZXJtaW5lZCBmb3Igc2NhbGFiaWxpdHkpICovCi0jZGVmaW5lIFpTV0FQX05SX1pQT09MUyAz
MgorLyogTnVtYmVyIG9mIHpwb29scyBpbiB6c3dhcF9wb29sICovCitzdGF0aWMgdW5zaWduZWQg
aW50IG5yX3pzd2FwX3pwb29scyBfX3JvX2FmdGVyX2luaXQ7CiAKIC8qIEVuYWJsZS9kaXNhYmxl
IG1lbW9yeSBwcmVzc3VyZS1iYXNlZCBzaHJpbmtlci4gKi8KIHN0YXRpYyBib29sIHpzd2FwX3No
cmlua2VyX2VuYWJsZWQgPSBJU19FTkFCTEVEKApAQCAtMTU2LDcgKzE1Niw3IEBAIHN0cnVjdCBj
cnlwdG9fYWNvbXBfY3R4IHsKICAqIG5lZWRzIHRvIGJlIHZlcmlmaWVkIHRoYXQgaXQncyBzdGls
bCB2YWxpZCBpbiB0aGUgdHJlZS4KICAqLwogc3RydWN0IHpzd2FwX3Bvb2wgewotCXN0cnVjdCB6
cG9vbCAqenBvb2xzW1pTV0FQX05SX1pQT09MU107CisJc3RydWN0IHpwb29sICoqenBvb2xzOwog
CXN0cnVjdCBjcnlwdG9fYWNvbXBfY3R4IF9fcGVyY3B1ICphY29tcF9jdHg7CiAJc3RydWN0IHBl
cmNwdV9yZWYgcmVmOwogCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsKQEAgLTI2OCw3ICsyNjgsMTQg
QEAgc3RhdGljIHN0cnVjdCB6c3dhcF9wb29sICp6c3dhcF9wb29sX2NyZWF0ZShjaGFyICp0eXBl
LCBjaGFyICpjb21wcmVzc29yKQogCWlmICghcG9vbCkKIAkJcmV0dXJuIE5VTEw7CiAKLQlmb3Ig
KGkgPSAwOyBpIDwgWlNXQVBfTlJfWlBPT0xTOyBpKyspIHsKKwlwb29sLT56cG9vbHMgPSBrY2Fs
bG9jKG5yX3pzd2FwX3pwb29scywgc2l6ZW9mKHBvb2wtPnpwb29sc1swXSksCisJCQkgICAgICAg
R0ZQX0tFUk5FTCk7CisJaWYgKCFwb29sLT56cG9vbHMpIHsKKwkJcHJfZXJyKCJ6cG9vbHMgYWxs
b2MgZmFpbGVkXG4iKTsKKwkJZ290byBlcnJvcjsKKwl9CisKKwlmb3IgKGkgPSAwOyBpIDwgbnJf
enN3YXBfenBvb2xzOyBpKyspIHsKIAkJLyogdW5pcXVlIG5hbWUgZm9yIGVhY2ggcG9vbCBzcGVj
aWZpY2FsbHkgcmVxdWlyZWQgYnkgenNtYWxsb2MgKi8KIAkJc25wcmludGYobmFtZSwgMzgsICJ6
c3dhcCV4IiwKIAkJCSBhdG9taWNfaW5jX3JldHVybigmenN3YXBfcG9vbHNfY291bnQpKTsKQEAg
LTMxMiw4ICszMTksMTEgQEAgc3RhdGljIHN0cnVjdCB6c3dhcF9wb29sICp6c3dhcF9wb29sX2Ny
ZWF0ZShjaGFyICp0eXBlLCBjaGFyICpjb21wcmVzc29yKQogZXJyb3I6CiAJaWYgKHBvb2wtPmFj
b21wX2N0eCkKIAkJZnJlZV9wZXJjcHUocG9vbC0+YWNvbXBfY3R4KTsKLQl3aGlsZSAoaS0tKQot
CQl6cG9vbF9kZXN0cm95X3Bvb2wocG9vbC0+enBvb2xzW2ldKTsKKwlpZiAocG9vbC0+enBvb2xz
KSB7CisJCXdoaWxlIChpLS0pCisJCQl6cG9vbF9kZXN0cm95X3Bvb2wocG9vbC0+enBvb2xzW2ld
KTsKKwkJa2ZyZWUocG9vbC0+enBvb2xzKTsKKwl9CiAJa2ZyZWUocG9vbCk7CiAJcmV0dXJuIE5V
TEw7CiB9CkBAIC0zNjksOCArMzc5LDkgQEAgc3RhdGljIHZvaWQgenN3YXBfcG9vbF9kZXN0cm95
KHN0cnVjdCB6c3dhcF9wb29sICpwb29sKQogCWNwdWhwX3N0YXRlX3JlbW92ZV9pbnN0YW5jZShD
UFVIUF9NTV9aU1dQX1BPT0xfUFJFUEFSRSwgJnBvb2wtPm5vZGUpOwogCWZyZWVfcGVyY3B1KHBv
b2wtPmFjb21wX2N0eCk7CiAKLQlmb3IgKGkgPSAwOyBpIDwgWlNXQVBfTlJfWlBPT0xTOyBpKysp
CisJZm9yIChpID0gMDsgaSA8IG5yX3pzd2FwX3pwb29sczsgaSsrKQogCQl6cG9vbF9kZXN0cm95
X3Bvb2wocG9vbC0+enBvb2xzW2ldKTsKKwlrZnJlZShwb29sLT56cG9vbHMpOwogCWtmcmVlKHBv
b2wpOwogfQogCkBAIC00OTYsNyArNTA3LDcgQEAgdW5zaWduZWQgbG9uZyB6c3dhcF90b3RhbF9w
YWdlcyh2b2lkKQogCWxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KHBvb2wsICZ6c3dhcF9wb29scywg
bGlzdCkgewogCQlpbnQgaTsKIAotCQlmb3IgKGkgPSAwOyBpIDwgWlNXQVBfTlJfWlBPT0xTOyBp
KyspCisJCWZvciAoaSA9IDA7IGkgPCBucl96c3dhcF96cG9vbHM7IGkrKykKIAkJCXRvdGFsICs9
IHpwb29sX2dldF90b3RhbF9wYWdlcyhwb29sLT56cG9vbHNbaV0pOwogCX0KIAlyY3VfcmVhZF91
bmxvY2soKTsKQEAgLTgwNSw3ICs4MTYsNyBAQCBzdGF0aWMgdm9pZCB6c3dhcF9lbnRyeV9jYWNo
ZV9mcmVlKHN0cnVjdCB6c3dhcF9lbnRyeSAqZW50cnkpCiAKIHN0YXRpYyBzdHJ1Y3QgenBvb2wg
Knpzd2FwX2ZpbmRfenBvb2woc3RydWN0IHpzd2FwX2VudHJ5ICplbnRyeSkKIHsKLQlyZXR1cm4g
ZW50cnktPnBvb2wtPnpwb29sc1toYXNoX3B0cihlbnRyeSwgaWxvZzIoWlNXQVBfTlJfWlBPT0xT
KSldOworCXJldHVybiBlbnRyeS0+cG9vbC0+enBvb2xzW2hhc2hfcHRyKGVudHJ5LCBpbG9nMihu
cl96c3dhcF96cG9vbHMpKV07CiB9CiAKIC8qCkBAIC0xNzY3LDYgKzE3NzgsMTIgQEAgc3RhdGlj
IGludCB6c3dhcF9zZXR1cCh2b2lkKQogCiBzdGF0aWMgaW50IF9faW5pdCB6c3dhcF9pbml0KHZv
aWQpCiB7CisJLyoKKwkgKiBVc2UgbXVsdGlwbGUgenBvb2xzIGZvciBzY2FsYWJpbGl0eSwgYnV0
IGF2b2lkIGFsbG9jYXRpbmcgdG9vIG1hbnkuCisJICogMzIgaXMgYW4gZW1waXJpY2FsbHkgZGV0
ZXJtaW5lZCBtYWdpYyBudW1iZXIuCisJICovCisJbnJfenN3YXBfenBvb2xzID0gbWluKDMyVSwg
bnVtX3Bvc3NpYmxlX2NwdXMoKSk7CisKIAlpZiAoIXpzd2FwX2VuYWJsZWQpCiAJCXJldHVybiAw
OwogCXJldHVybiB6c3dhcF9zZXR1cCgpOwotLSAKMi40NS4xLjI4OC5nMGUwY2QyOTlmMS1nb29n
Cgo=
--000000000000c4f0d6061a1bd166--
