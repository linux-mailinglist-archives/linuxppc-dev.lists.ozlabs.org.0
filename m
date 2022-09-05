Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF695ACC0E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 09:17:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLfwn4sZkz2yy6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 17:17:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=MRHsWs7B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.50; helo=m1550.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=MRHsWs7B;
	dkim-atps=neutral
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLfw45MzQz2xkc
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 17:16:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=fXjWj
	frN4VnAcZC8vVdmQxIHdCa6zxfOcfzDKl5wfjI=; b=MRHsWs7BB/SkYfAAVCV3x
	b/l3OlQSzneQNQEqrPXgPNt0SBp50A0i9HFzcxfnthtGNGfJZ3/JckRKe4lqJqBM
	CA0dgsU/i3RQ4dNPH/xB/t80wIHhpRD9Z6zmb1s9mtznJD7WgjQuD11wA4sI5ScQ
	4IsM4uVjTUU6WP+SG849gA=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr50
 (Coremail) ; Mon, 5 Sep 2022 15:16:21 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Mon, 5 Sep 2022 15:16:21 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>
Subject: Re:Re: [PATCH v2] powerpc: kernel: legacy_serial: Fix missing
 of_node_put() in add_legacy_soc_port()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <87czcatsct.fsf@mpe.ellerman.id.au>
References: <20220702013714.263614-1-windhl@126.com>
 <87czcatsct.fsf@mpe.ellerman.id.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <7c043670.4bc1.1830c81ddeb.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowABnvfFGohVjr25nAA--.22721W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3BdzF1pEENSN3wABsm
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CgoKQXQgMjAyMi0wOS0wNSAxMToyNTozOCwgIk1pY2hhZWwgRWxsZXJtYW4iIDxtcGVAZWxsZXJt
YW4uaWQuYXU+IHdyb3RlOgo+TGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPiB3cml0ZXM6Cj4+IFdl
IHNob3VsZCBjYWxsIG9mX25vZGVfcHV0KCkgZm9yIHRoZSByZWZlcmVuY2UgJ3RzaScgcmV0dXJu
ZWQgYnkKPj4gb2ZfZ2V0X3BhcmVudCgpIHdoaWNoIHdpbGwgaW5jcmVhc2UgdGhlIHJlZmNvdW50
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+Cj4+IC0tLQo+
PiAgY2hhbmdlbG9nOgo+Pgo+PiAgdjI6IHVzZSBtb3JlIGNvbnNlcnZhdGl2ZSB3YXkgdG8gY2Fs
bCBvZl9ub2RlX3B1dCgpCj4+ICB2MTogbW92ICdvZl9ub2RlX3B1dCgpJyBpbnRvIHRoZSAnaWYn
IGNvbmRpdGlvbgo+Pgo+PiAgdjEgTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjIwNzAxMTMwMjAzLjI0MDAyMy0xLXdpbmRobEAxMjYuY29tLwo+Pgo+PiAgYXJjaC9wb3dlcnBj
L2tlcm5lbC9sZWdhY3lfc2VyaWFsLmMgfCAxMSArKysrKysrKy0tLQo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvbGVnYWN5X3NlcmlhbC5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9s
ZWdhY3lfc2VyaWFsLmMKPj4gaW5kZXggZjA0OGM0MjRjNTI1Li5jY2E3MjA4MWI4NjQgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvbGVnYWN5X3NlcmlhbC5jCj4+ICsrKyBiL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvbGVnYWN5X3NlcmlhbC5jCj4+IEBAIC0xNjYsNyArMTY2LDcgQEAg
c3RhdGljIGludCBfX2luaXQgYWRkX2xlZ2FjeV9zb2NfcG9ydChzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wLAo+PiAgewo+PiAgCXU2NCBhZGRyOwo+PiAgCWNvbnN0IF9fYmUzMiAqYWRkcnA7Cj4+IC0J
c3RydWN0IGRldmljZV9ub2RlICp0c2kgPSBvZl9nZXRfcGFyZW50KG5wKTsKPj4gKwlzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKnRzaTsKPj4gIAo+PiAgCS8qIFdlIG9ubHkgc3VwcG9ydCBwb3J0cyB0aGF0
IGhhdmUgYSBjbG9jayBmcmVxdWVuY3kgcHJvcGVybHkKPj4gIAkgKiBlbmNvZGVkIGluIHRoZSBk
ZXZpY2UtdHJlZS4KPj4gQEAgLTE5NCwxMiArMTk0LDE3IEBAIHN0YXRpYyBpbnQgX19pbml0IGFk
ZF9sZWdhY3lfc29jX3BvcnQoc3RydWN0IGRldmljZV9ub2RlICpucCwKPj4gIAkvKiBBZGQgcG9y
dCwgaXJxIHdpbGwgYmUgZGVhbHQgd2l0aCBsYXRlci4gV2UgcGFzc2VkIGEgdHJhbnNsYXRlZAo+
PiAgCSAqIElPIHBvcnQgdmFsdWUuIEl0IHdpbGwgYmUgZml4ZWQgdXAgbGF0ZXIgYWxvbmcgd2l0
aCB0aGUgaXJxCj4+ICAJICovCj4+IC0JaWYgKG9mX25vZGVfaXNfdHlwZSh0c2ksICJ0c2ktYnJp
ZGdlIikpCj4+ICsJdHNpID0gb2ZfZ2V0X3BhcmVudChucCk7Cj4+ICsJaWYgKG9mX25vZGVfaXNf
dHlwZSh0c2ksICJ0c2ktYnJpZGdlIikpIHsKPj4gKwkJb2Zfbm9kZV9wdXQodHNpKTsKPj4gIAkJ
cmV0dXJuIGFkZF9sZWdhY3lfcG9ydChucCwgLTEsIFVQSU9fVFNJLCBhZGRyLCBhZGRyLAo+PiAg
CQkJCSAgICAgICAwLCBsZWdhY3lfcG9ydF9mbGFncywgMCk7Cj4+IC0JZWxzZQo+PiArCX0KPj4g
KwllbHNlIHsKPj4gKwkJb2Zfbm9kZV9wdXQodHNpKTsKPj4gIAkJcmV0dXJuIGFkZF9sZWdhY3lf
cG9ydChucCwgLTEsIFVQSU9fTUVNLCBhZGRyLCBhZGRyLAo+PiAgCQkJCSAgICAgICAwLCBsZWdh
Y3lfcG9ydF9mbGFncywgMCk7Cj4+ICsJfQo+PiAgfQo+Cj5UaGUgdHdvIGxlZ3Mgb2YgdGhlIGVs
c2UgZW5kIHVwIHdpdGggZHVwbGljYXRlZCBjb2RlIGV4Y2VwdCBmb3IgYSBzaW5nbGUKPnBhcmFt
ZXRlciB0byBhZGRfbGVnYWN5X3BvcnQoKS4KPgo+QmV0dGVyIHdvdWxkIGJlOgo+Cj57Cj4JaW50
IGlvdHlwZTsKPiAgICAgICAgLi4uCj4KPgl0c2kgPSBvZl9nZXRfcGFyZW50KG5wKTsKPglpZiAo
b2Zfbm9kZV9pc190eXBlKHRzaSwgInRzaS1icmlkZ2UiKSkKPgkJaW90eXBlID0gVVBJT19UU0k7
Cj4JZWxzZQo+CQlpb3R5cGUgPSBVUElPX01FTTsKPgo+CW9mX25vZGVfcHV0KHRzaSk7Cj4gICAg
ICAgIHJldHVybiBhZGRfbGVnYWN5X3BvcnQobnAsIC0xLCBpb3R5cGUsIGFkZHIsIGFkZHIsIDAs
IGxlZ2FjeV9wb3J0X2ZsYWdzLCAwKTsKPn0KPgo+Cj5jaGVlcnMKClRoYW5rcywgCkkgd2lsbCBn
aXZlIGFub3RoZXIgdmVyc2lvbiBvZiB0aGlzIHBhdGNoLgoKTGlhbmcK
