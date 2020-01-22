Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFD9145D34
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 21:40:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482y2R2nmYzDqVn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 07:39:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=Nv+blg0T; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482xzx0FsMzDqWP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 07:37:48 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id w1so560645ljh.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 12:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1+kxcgoKIXPNuz6q7BSkcKmnHRpZmOPFZkwDBO8bnF8=;
 b=Nv+blg0TyQMtacRxU2I6XSnt+AhuBO5PVbLffDiwNK7dfKfQ1HlL2njn4Kcc5QQvZC
 XrHkMOJ+TNVsqTo8xaGGY88gnEs4R8k0lv0gFFN6v0GDSlu9DdRmk50IvrRk3lq41JME
 pkknTcORBQobhN/Fny+iskXXCM8I4BshRRTHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1+kxcgoKIXPNuz6q7BSkcKmnHRpZmOPFZkwDBO8bnF8=;
 b=B4LTVxOyfcIJFaoZGmNuGpSh44kIWpdmkUIb8qmGpeKo9PzJVe5M9NCdlvdQTtgEI6
 Ry26NAoFLh0TxT3bxOdDOBh8/nCdDXBRqwcpLYtTIstqJPGVhFgCI6Qz349iuQUKVJTC
 dpii73bgud9BkGXfoRfU2Vc0Q2BCO4iK+kua3yfrfMAaVUnyidgxsYg3vanUJdEuLVVw
 dvGG6JqT+Lgdv604VrSoICc5jnKQ8nFYSJlAM2p7VjPa7IZVl0AS9WatVffz5d1Ccx3+
 B1QZHvM5dcRc9w3yLha20r7de3E5SBraTSWa+pVI2Dnnb5hFlsfL6aE4luWr6F+WaQ7O
 VCBA==
X-Gm-Message-State: APjAAAXasBW5KAtorSUPtrxvHfCzgWGwpEl+DkOwkLHI8dr2jrv9NpiI
 sXZ4lbS8bXYHG4Cto30Cu1Mfz14LzyQ=
X-Google-Smtp-Source: APXvYqwNn/vhmfFXFGCvPVUpknsfrKurB27lQC6PqVacNME9kFj6pu2FxA7XY1tn4M+0Gi6sj61dyw==
X-Received: by 2002:a2e:2201:: with SMTP id i1mr20331269lji.110.1579725463419; 
 Wed, 22 Jan 2020 12:37:43 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48])
 by smtp.gmail.com with ESMTPSA id o6sm1004947lfg.11.2020.01.22.12.37.42
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2020 12:37:42 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 203so590092lfa.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 12:37:42 -0800 (PST)
X-Received: by 2002:ac2:4839:: with SMTP id 25mr2702966lft.192.1579725461822; 
 Wed, 22 Jan 2020 12:37:41 -0800 (PST)
MIME-Version: 1.0
References: <12a4be679e43de1eca6e5e2173163f27e2f25236.1579715466.git.christophe.leroy@c-s.fr>
 <CAHk-=wgNQ-rWoLg0OCJYYYbKBnRAUK4NPU-OD+vv-6fWnd=8kA@mail.gmail.com>
 <CAHk-=winQ_607Sp09H1w70A_WPmt7ydxrNrwvk=N29S=FpASZw@mail.gmail.com>
In-Reply-To: <CAHk-=winQ_607Sp09H1w70A_WPmt7ydxrNrwvk=N29S=FpASZw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Jan 2020 12:37:25 -0800
X-Gmail-Original-Message-ID: <CAHk-=whzabmci2b7ras3RcMpimvzNAk4QHDcYf=irvwXnunS8w@mail.gmail.com>
Message-ID: <CAHk-=whzabmci2b7ras3RcMpimvzNAk4QHDcYf=irvwXnunS8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] fs/readdir: Fix filldir() and filldir64() use of
 user_access_begin()
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: multipart/mixed; boundary="000000000000feceab059cc07e0e"
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000feceab059cc07e0e
Content-Type: text/plain; charset="UTF-8"

[ Talking to myself ]

On Wed, Jan 22, 2020 at 12:00 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> COMPLETELY UNTESTED! It compiles for me. The generated assembly looks
> ok from a quick look.

Some more testing shows that objtool is unhappy about how we do that
signal_pending(current) inside the user access region.

I didn't notice because my test builds were with sane kernel
configurations so that I could look at the generated code.

But with KASAN enabled, the signal check causes accesses that KASAN
wants to check, and I get

  objtool: filldir()+0x395: call to __kasan_check_read() with UACCESS enabled

warnings.

So that patch of mine isn't acceptable for silly reasons, and the
signal check itself would need to be done outside of the user access
area.

That actually makes the whole "let's do the &prev->d_off setting
unconditionally" much more interesting.

So here's a slightly updated patch that does exactly that, and avoids
the objtool warning.

It actually generates better code than the last one too, because now
we don't duplicate the user_access_end() for the EINTR case.

So test this one instead, please.

                 Linus

--000000000000feceab059cc07e0e
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_k5prqoze0>
X-Attachment-Id: f_k5prqoze0

IGZzL3JlYWRkaXIuYyB8IDcwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyks
IDM2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3JlYWRkaXIuYyBiL2ZzL3JlYWRkaXIu
YwppbmRleCBkMjZkNWVhNGRlN2IuLjM1YmU0Y2E2YjM1NCAxMDA2NDQKLS0tIGEvZnMvcmVhZGRp
ci5jCisrKyBiL2ZzL3JlYWRkaXIuYwpAQCAtMjA2LDcgKzIwNiw3IEBAIHN0cnVjdCBsaW51eF9k
aXJlbnQgewogc3RydWN0IGdldGRlbnRzX2NhbGxiYWNrIHsKIAlzdHJ1Y3QgZGlyX2NvbnRleHQg
Y3R4OwogCXN0cnVjdCBsaW51eF9kaXJlbnQgX191c2VyICogY3VycmVudF9kaXI7Ci0Jc3RydWN0
IGxpbnV4X2RpcmVudCBfX3VzZXIgKiBwcmV2aW91czsKKwlpbnQgcHJldl9yZWNsZW47CiAJaW50
IGNvdW50OwogCWludCBlcnJvcjsKIH07CkBAIC0yMTQsMTIgKzIxNCwxMyBAQCBzdHJ1Y3QgZ2V0
ZGVudHNfY2FsbGJhY2sgewogc3RhdGljIGludCBmaWxsZGlyKHN0cnVjdCBkaXJfY29udGV4dCAq
Y3R4LCBjb25zdCBjaGFyICpuYW1lLCBpbnQgbmFtbGVuLAogCQkgICBsb2ZmX3Qgb2Zmc2V0LCB1
NjQgaW5vLCB1bnNpZ25lZCBpbnQgZF90eXBlKQogewotCXN0cnVjdCBsaW51eF9kaXJlbnQgX191
c2VyICogZGlyZW50OworCXN0cnVjdCBsaW51eF9kaXJlbnQgX191c2VyICpkaXJlbnQsICpwcmV2
OwogCXN0cnVjdCBnZXRkZW50c19jYWxsYmFjayAqYnVmID0KIAkJY29udGFpbmVyX29mKGN0eCwg
c3RydWN0IGdldGRlbnRzX2NhbGxiYWNrLCBjdHgpOwogCXVuc2lnbmVkIGxvbmcgZF9pbm87CiAJ
aW50IHJlY2xlbiA9IEFMSUdOKG9mZnNldG9mKHN0cnVjdCBsaW51eF9kaXJlbnQsIGRfbmFtZSkg
KyBuYW1sZW4gKyAyLAogCQlzaXplb2YobG9uZykpOworCWludCBwcmV2X3JlY2xlbjsKIAogCWJ1
Zi0+ZXJyb3IgPSB2ZXJpZnlfZGlyZW50X25hbWUobmFtZSwgbmFtbGVuKTsKIAlpZiAodW5saWtl
bHkoYnVmLT5lcnJvcikpCkBAIC0yMzIsMjggKzIzMywyNCBAQCBzdGF0aWMgaW50IGZpbGxkaXIo
c3RydWN0IGRpcl9jb250ZXh0ICpjdHgsIGNvbnN0IGNoYXIgKm5hbWUsIGludCBuYW1sZW4sCiAJ
CWJ1Zi0+ZXJyb3IgPSAtRU9WRVJGTE9XOwogCQlyZXR1cm4gLUVPVkVSRkxPVzsKIAl9Ci0JZGly
ZW50ID0gYnVmLT5wcmV2aW91czsKLQlpZiAoZGlyZW50ICYmIHNpZ25hbF9wZW5kaW5nKGN1cnJl
bnQpKQorCXByZXZfcmVjbGVuID0gYnVmLT5wcmV2X3JlY2xlbjsKKwlpZiAocHJldl9yZWNsZW4g
JiYgc2lnbmFsX3BlbmRpbmcoY3VycmVudCkpCiAJCXJldHVybiAtRUlOVFI7Ci0KLQkvKgotCSAq
IE5vdGUhIFRoaXMgcmFuZ2UtY2hlY2tzICdwcmV2aW91cycgKHdoaWNoIG1heSBiZSBOVUxMKS4K
LQkgKiBUaGUgcmVhbCByYW5nZSB3YXMgY2hlY2tlZCBpbiBnZXRkZW50cwotCSAqLwotCWlmICgh
dXNlcl9hY2Nlc3NfYmVnaW4oZGlyZW50LCBzaXplb2YoKmRpcmVudCkpKQotCQlnb3RvIGVmYXVs
dDsKLQlpZiAoZGlyZW50KQotCQl1bnNhZmVfcHV0X3VzZXIob2Zmc2V0LCAmZGlyZW50LT5kX29m
ZiwgZWZhdWx0X2VuZCk7CiAJZGlyZW50ID0gYnVmLT5jdXJyZW50X2RpcjsKKwlwcmV2ID0gKHZv
aWQgX191c2VyICopIGRpcmVudCAtIHByZXZfcmVjbGVuOworCWlmICghdXNlcl9hY2Nlc3NfYmVn
aW4ocHJldiwgcmVjbGVuICsgcHJldl9yZWNsZW4pKQorCQlnb3RvIGVmYXVsdDsKKworCS8qIFRo
aXMgbWlnaHQgYmUgJ2RpcmVudC0+ZF9vZmYnLCBidXQgaWYgc28gaXQgd2lsbCBnZXQgb3Zlcndy
aXR0ZW4gKi8KKwl1bnNhZmVfcHV0X3VzZXIob2Zmc2V0LCAmcHJldi0+ZF9vZmYsIGVmYXVsdF9l
bmQpOwogCXVuc2FmZV9wdXRfdXNlcihkX2lubywgJmRpcmVudC0+ZF9pbm8sIGVmYXVsdF9lbmQp
OwogCXVuc2FmZV9wdXRfdXNlcihyZWNsZW4sICZkaXJlbnQtPmRfcmVjbGVuLCBlZmF1bHRfZW5k
KTsKIAl1bnNhZmVfcHV0X3VzZXIoZF90eXBlLCAoY2hhciBfX3VzZXIgKikgZGlyZW50ICsgcmVj
bGVuIC0gMSwgZWZhdWx0X2VuZCk7CiAJdW5zYWZlX2NvcHlfZGlyZW50X25hbWUoZGlyZW50LT5k
X25hbWUsIG5hbWUsIG5hbWxlbiwgZWZhdWx0X2VuZCk7CiAJdXNlcl9hY2Nlc3NfZW5kKCk7CiAK
LQlidWYtPnByZXZpb3VzID0gZGlyZW50OwotCWRpcmVudCA9ICh2b2lkIF9fdXNlciAqKWRpcmVu
dCArIHJlY2xlbjsKLQlidWYtPmN1cnJlbnRfZGlyID0gZGlyZW50OworCWJ1Zi0+Y3VycmVudF9k
aXIgPSAodm9pZCBfX3VzZXIgKilkaXJlbnQgKyByZWNsZW47CisJYnVmLT5wcmV2X3JlY2xlbiA9
IHJlY2xlbjsKIAlidWYtPmNvdW50IC09IHJlY2xlbjsKIAlyZXR1cm4gMDsKIGVmYXVsdF9lbmQ6
CkBAIC0yNjcsNyArMjY0LDYgQEAgU1lTQ0FMTF9ERUZJTkUzKGdldGRlbnRzLCB1bnNpZ25lZCBp
bnQsIGZkLAogCQlzdHJ1Y3QgbGludXhfZGlyZW50IF9fdXNlciAqLCBkaXJlbnQsIHVuc2lnbmVk
IGludCwgY291bnQpCiB7CiAJc3RydWN0IGZkIGY7Ci0Jc3RydWN0IGxpbnV4X2RpcmVudCBfX3Vz
ZXIgKiBsYXN0ZGlyZW50OwogCXN0cnVjdCBnZXRkZW50c19jYWxsYmFjayBidWYgPSB7CiAJCS5j
dHguYWN0b3IgPSBmaWxsZGlyLAogCQkuY291bnQgPSBjb3VudCwKQEAgLTI4NSw4ICsyODEsMTAg
QEAgU1lTQ0FMTF9ERUZJTkUzKGdldGRlbnRzLCB1bnNpZ25lZCBpbnQsIGZkLAogCWVycm9yID0g
aXRlcmF0ZV9kaXIoZi5maWxlLCAmYnVmLmN0eCk7CiAJaWYgKGVycm9yID49IDApCiAJCWVycm9y
ID0gYnVmLmVycm9yOwotCWxhc3RkaXJlbnQgPSBidWYucHJldmlvdXM7Ci0JaWYgKGxhc3RkaXJl
bnQpIHsKKwlpZiAoYnVmLnByZXZfcmVjbGVuKSB7CisJCXN0cnVjdCBsaW51eF9kaXJlbnQgX191
c2VyICogbGFzdGRpcmVudDsKKwkJbGFzdGRpcmVudCA9ICh2b2lkIF9fdXNlciAqKWJ1Zi5jdXJy
ZW50X2RpciAtIGJ1Zi5wcmV2X3JlY2xlbjsKKwogCQlpZiAocHV0X3VzZXIoYnVmLmN0eC5wb3Ms
ICZsYXN0ZGlyZW50LT5kX29mZikpCiAJCQllcnJvciA9IC1FRkFVTFQ7CiAJCWVsc2UKQEAgLTI5
OSw3ICsyOTcsNyBAQCBTWVNDQUxMX0RFRklORTMoZ2V0ZGVudHMsIHVuc2lnbmVkIGludCwgZmQs
CiBzdHJ1Y3QgZ2V0ZGVudHNfY2FsbGJhY2s2NCB7CiAJc3RydWN0IGRpcl9jb250ZXh0IGN0eDsK
IAlzdHJ1Y3QgbGludXhfZGlyZW50NjQgX191c2VyICogY3VycmVudF9kaXI7Ci0Jc3RydWN0IGxp
bnV4X2RpcmVudDY0IF9fdXNlciAqIHByZXZpb3VzOworCWludCBwcmV2X3JlY2xlbjsKIAlpbnQg
Y291bnQ7CiAJaW50IGVycm9yOwogfTsKQEAgLTMwNywxMSArMzA1LDEyIEBAIHN0cnVjdCBnZXRk
ZW50c19jYWxsYmFjazY0IHsKIHN0YXRpYyBpbnQgZmlsbGRpcjY0KHN0cnVjdCBkaXJfY29udGV4
dCAqY3R4LCBjb25zdCBjaGFyICpuYW1lLCBpbnQgbmFtbGVuLAogCQkgICAgIGxvZmZfdCBvZmZz
ZXQsIHU2NCBpbm8sIHVuc2lnbmVkIGludCBkX3R5cGUpCiB7Ci0Jc3RydWN0IGxpbnV4X2RpcmVu
dDY0IF9fdXNlciAqZGlyZW50OworCXN0cnVjdCBsaW51eF9kaXJlbnQ2NCBfX3VzZXIgKmRpcmVu
dCwgKnByZXY7CiAJc3RydWN0IGdldGRlbnRzX2NhbGxiYWNrNjQgKmJ1ZiA9CiAJCWNvbnRhaW5l
cl9vZihjdHgsIHN0cnVjdCBnZXRkZW50c19jYWxsYmFjazY0LCBjdHgpOwogCWludCByZWNsZW4g
PSBBTElHTihvZmZzZXRvZihzdHJ1Y3QgbGludXhfZGlyZW50NjQsIGRfbmFtZSkgKyBuYW1sZW4g
KyAxLAogCQlzaXplb2YodTY0KSk7CisJaW50IHByZXZfcmVjbGVuOwogCiAJYnVmLT5lcnJvciA9
IHZlcmlmeV9kaXJlbnRfbmFtZShuYW1lLCBuYW1sZW4pOwogCWlmICh1bmxpa2VseShidWYtPmVy
cm9yKSkKQEAgLTMxOSwzMCArMzE4LDI4IEBAIHN0YXRpYyBpbnQgZmlsbGRpcjY0KHN0cnVjdCBk
aXJfY29udGV4dCAqY3R4LCBjb25zdCBjaGFyICpuYW1lLCBpbnQgbmFtbGVuLAogCWJ1Zi0+ZXJy
b3IgPSAtRUlOVkFMOwkvKiBvbmx5IHVzZWQgaWYgd2UgZmFpbC4uICovCiAJaWYgKHJlY2xlbiA+
IGJ1Zi0+Y291bnQpCiAJCXJldHVybiAtRUlOVkFMOwotCWRpcmVudCA9IGJ1Zi0+cHJldmlvdXM7
Ci0JaWYgKGRpcmVudCAmJiBzaWduYWxfcGVuZGluZyhjdXJyZW50KSkKKwlwcmV2X3JlY2xlbiA9
IGJ1Zi0+cHJldl9yZWNsZW47CisJaWYgKHByZXZfcmVjbGVuICYmIHNpZ25hbF9wZW5kaW5nKGN1
cnJlbnQpKQogCQlyZXR1cm4gLUVJTlRSOwotCi0JLyoKLQkgKiBOb3RlISBUaGlzIHJhbmdlLWNo
ZWNrcyAncHJldmlvdXMnICh3aGljaCBtYXkgYmUgTlVMTCkuCi0JICogVGhlIHJlYWwgcmFuZ2Ug
d2FzIGNoZWNrZWQgaW4gZ2V0ZGVudHMKLQkgKi8KLQlpZiAoIXVzZXJfYWNjZXNzX2JlZ2luKGRp
cmVudCwgc2l6ZW9mKCpkaXJlbnQpKSkKLQkJZ290byBlZmF1bHQ7Ci0JaWYgKGRpcmVudCkKLQkJ
dW5zYWZlX3B1dF91c2VyKG9mZnNldCwgJmRpcmVudC0+ZF9vZmYsIGVmYXVsdF9lbmQpOwogCWRp
cmVudCA9IGJ1Zi0+Y3VycmVudF9kaXI7CisJcHJldiA9ICh2b2lkIF9fdXNlciAqKWRpcmVudCAt
IHByZXZfcmVjbGVuOworCWlmICghdXNlcl9hY2Nlc3NfYmVnaW4ocHJldiwgcmVjbGVuICsgcHJl
dl9yZWNsZW4pKQorCQlnb3RvIGVmYXVsdDsKKworCS8qIFRoaXMgbWlnaHQgYmUgJ2RpcmVudC0+
ZF9vZmYnLCBidXQgaWYgc28gaXQgd2lsbCBnZXQgb3ZlcndyaXR0ZW4gKi8KKwl1bnNhZmVfcHV0
X3VzZXIob2Zmc2V0LCAmcHJldi0+ZF9vZmYsIGVmYXVsdF9lbmQpOwogCXVuc2FmZV9wdXRfdXNl
cihpbm8sICZkaXJlbnQtPmRfaW5vLCBlZmF1bHRfZW5kKTsKIAl1bnNhZmVfcHV0X3VzZXIocmVj
bGVuLCAmZGlyZW50LT5kX3JlY2xlbiwgZWZhdWx0X2VuZCk7CiAJdW5zYWZlX3B1dF91c2VyKGRf
dHlwZSwgJmRpcmVudC0+ZF90eXBlLCBlZmF1bHRfZW5kKTsKIAl1bnNhZmVfY29weV9kaXJlbnRf
bmFtZShkaXJlbnQtPmRfbmFtZSwgbmFtZSwgbmFtbGVuLCBlZmF1bHRfZW5kKTsKIAl1c2VyX2Fj
Y2Vzc19lbmQoKTsKIAotCWJ1Zi0+cHJldmlvdXMgPSBkaXJlbnQ7CisJYnVmLT5wcmV2X3JlY2xl
biA9IHJlY2xlbjsKIAlkaXJlbnQgPSAodm9pZCBfX3VzZXIgKilkaXJlbnQgKyByZWNsZW47CiAJ
YnVmLT5jdXJyZW50X2RpciA9IGRpcmVudDsKIAlidWYtPmNvdW50IC09IHJlY2xlbjsKIAlyZXR1
cm4gMDsKKwogZWZhdWx0X2VuZDoKIAl1c2VyX2FjY2Vzc19lbmQoKTsKIGVmYXVsdDoKQEAgLTM1
NCw3ICszNTEsNiBAQCBpbnQga3N5c19nZXRkZW50czY0KHVuc2lnbmVkIGludCBmZCwgc3RydWN0
IGxpbnV4X2RpcmVudDY0IF9fdXNlciAqZGlyZW50LAogCQkgICAgdW5zaWduZWQgaW50IGNvdW50
KQogewogCXN0cnVjdCBmZCBmOwotCXN0cnVjdCBsaW51eF9kaXJlbnQ2NCBfX3VzZXIgKiBsYXN0
ZGlyZW50OwogCXN0cnVjdCBnZXRkZW50c19jYWxsYmFjazY0IGJ1ZiA9IHsKIAkJLmN0eC5hY3Rv
ciA9IGZpbGxkaXI2NCwKIAkJLmNvdW50ID0gY291bnQsCkBAIC0zNzIsOSArMzY4LDExIEBAIGlu
dCBrc3lzX2dldGRlbnRzNjQodW5zaWduZWQgaW50IGZkLCBzdHJ1Y3QgbGludXhfZGlyZW50NjQg
X191c2VyICpkaXJlbnQsCiAJZXJyb3IgPSBpdGVyYXRlX2RpcihmLmZpbGUsICZidWYuY3R4KTsK
IAlpZiAoZXJyb3IgPj0gMCkKIAkJZXJyb3IgPSBidWYuZXJyb3I7Ci0JbGFzdGRpcmVudCA9IGJ1
Zi5wcmV2aW91czsKLQlpZiAobGFzdGRpcmVudCkgeworCWlmIChidWYucHJldl9yZWNsZW4pIHsK
KwkJc3RydWN0IGxpbnV4X2RpcmVudDY0IF9fdXNlciAqIGxhc3RkaXJlbnQ7CiAJCXR5cGVvZihs
YXN0ZGlyZW50LT5kX29mZikgZF9vZmYgPSBidWYuY3R4LnBvczsKKworCQlsYXN0ZGlyZW50ID0g
KHZvaWQgX191c2VyICopIGJ1Zi5jdXJyZW50X2RpciAtIGJ1Zi5wcmV2X3JlY2xlbjsKIAkJaWYg
KF9fcHV0X3VzZXIoZF9vZmYsICZsYXN0ZGlyZW50LT5kX29mZikpCiAJCQllcnJvciA9IC1FRkFV
TFQ7CiAJCWVsc2UK
--000000000000feceab059cc07e0e--
