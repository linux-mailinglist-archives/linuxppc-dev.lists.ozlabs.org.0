Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E2D55036F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 10:06:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ7m733Gpz3cf1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 18:06:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=jNf4loNn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.50; helo=m1550.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=jNf4loNn;
	dkim-atps=neutral
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ7lT4Dlkz3bls
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 18:06:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=ziDry
	BconZfbcDrkQjVtFWCm4II6YDZsPgZ8pg5lf4U=; b=jNf4loNn/WBLUTy1DgT37
	f+68unl2kHORyj9TbymIOwtlh9/aw4s1BbC29lUZYYRaIwt5dOAv8qJVNK1QDr8h
	XDlg+/u4Wl7wE/A+Y/mQRk49i1WCzednsQccYhAHh97hEudXV4kza1BkboBti2nE
	GU2XakAgj5ysfnjwTXhrTQ=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr50
 (Coremail) ; Sat, 18 Jun 2022 16:03:28 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Sat, 18 Jun 2022 16:03:28 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>
Subject: Re:Re: [PATCH] powerpc: kernel: Change the order of of_node_put()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <a6a5e5b3-ffd1-904b-bba1-22baff5f7b67@csgroup.eu>
References: <20220617112636.4041671-1-windhl@126.com>
 <a6a5e5b3-ffd1-904b-bba1-22baff5f7b67@csgroup.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <61c85548.1a55.18175d69e21.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowADnPPHRhq1ide84AA--.58025W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhEkF18RPUWxtgAAsd
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
Cc: "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gpiccoli@igalia.com" <gpiccoli@igalia.com>, "paulus@samba.org" <paulus@samba.org>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "rppt@kernel.org" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CgoKCgrlnKggMjAyMi0wNi0xOCAxNToxMzoxM++8jCJDaHJpc3RvcGhlIExlcm95IiA8Y2hyaXN0
b3BoZS5sZXJveUBjc2dyb3VwLmV1PiDlhpnpgZPvvJoKPgo+Cj5MZSAxNy8wNi8yMDIyIMOgIDEz
OjI2LCBMaWFuZyBIZSBhIMOpY3JpdMKgOgo+PiBJbiBhZGRfcGNzcGtyKCksIGl0IGlzIGJldHRl
ciB0byBjYWxsIG9mX25vZGVfcHV0KCkgYWZ0ZXIgdGhlCj4+ICdpZighbnApJyBjaGVjay4KPgo+
V2h5IGlzIGl0IGJldHRlciA/Cj4KPgo+Cj4vKioKPiAgKiBvZl9ub2RlX3B1dCgpIC0gRGVjcmVt
ZW50IHJlZmNvdW50IG9mIGEgbm9kZQo+ICAqIEBub2RlOglOb2RlIHRvIGRlYyByZWZjb3VudCwg
TlVMTCBpcyBzdXBwb3J0ZWQgdG8gc2ltcGxpZnkgd3JpdGluZyBvZgo+ICAqCQljYWxsZXJzCj4g
ICovCj52b2lkIG9mX25vZGVfcHV0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKPnsKPglpZiAo
bm9kZSkKPgkJa29iamVjdF9wdXQoJm5vZGUtPmtvYmopOwo+fQo+RVhQT1JUX1NZTUJPTChvZl9u
b2RlX3B1dCk7Cj4KPgo+Cj5DaHJpc3RvcGhlCgpIaSwgQ2hyaXN0b3BoZS4KClRoYW5rcyBmb3Ig
eW91ciByZXBseSBhbmQgSSB3YW50IHRvIGhhdmUgYSBkaXNjdXNzaW9uLgoKSW4gbXkgdGhvdWdo
dCwgeHh4X3B1dChwb2ludGVyKSdzIHNlbWFudGljIHVzdWFsbHkgbWVhbnMgCnRoaXMgcmVmZXJl
bmNlIGhhcyBiZWVuIHVzZWQgZG9uZSBhbmQgd2lsbCBub3QgYmUgdXNlZCAKYW55bW9yZS4gSXMg
dGhpcyBzZW1hbnRpYyBtb3JlIHJlYXNvbmFibGUsIHJpZ2h0PwoKQmVzaWRlcywgaWYgdGhlIG5w
IGlzIE5VTEwsIHdlIGNhbiBqdXN0IHJldHVybiBhbmQgc2F2ZSBhIGNwdSAKdGltZSBmb3IgdGhl
IHh4eF9wdXQoKSBjYWxsLgoKT3RoZXJ3aXNlLCBJIHByZWZlciB0byBjYWxsIGl0ICd1c2UoY2hl
Y2spLWFmdGVyLXB1dCcuICAKCkluIGZhY3QsIEkgaGF2ZSBtZWV0IG1hbnkgb3RoZXIgJ3VzZShj
aGVjayktYWZ0ZXItcHV0JyBpbnN0YW5jZXMKYWZ0ZXIgSSBzZW5kIHRoaXMgcGF0Y2gtY29tbWl0
LCBzbyBJIGFtIHdhaXRpbmcgZm9yIHRoaXMgCmRpc2N1c3Npb24uCgpUaGlzIGlzIGp1c3QgbXkg
dGhvdWdodCwgaXQgbWF5IGJlIHdyb25nLgoKQW55d2F5LCB0aGFua3MgZm9yIHlvdXIgcmVwbHku
CgpMaWFuZwoKPgo+Cj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBMaWFuZyBIZSA8d2luZGhsQDEyNi5j
b20+Cj4+IC0tLQo+PiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXAtY29tbW9uLmMgfCAyICst
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+IAo+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cC1jb21tb24uYyBiL2FyY2gv
cG93ZXJwYy9rZXJuZWwvc2V0dXAtY29tbW9uLmMKPj4gaW5kZXggZWIwMDc3YjMwMmUyLi43NjE4
MTdkMWY0ZGIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXAtY29tbW9u
LmMKPj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cC1jb21tb24uYwo+PiBAQCAtNTYz
LDkgKzU2Myw5IEBAIHN0YXRpYyBfX2luaXQgaW50IGFkZF9wY3Nwa3Iodm9pZCkKPj4gICAJaW50
IHJldDsKPj4gICAKPj4gICAJbnAgPSBvZl9maW5kX2NvbXBhdGlibGVfbm9kZShOVUxMLCBOVUxM
LCAicG5wUE5QLDEwMCIpOwo+PiAtCW9mX25vZGVfcHV0KG5wKTsKPj4gICAJaWYgKCFucCkKPj4g
ICAJCXJldHVybiAtRU5PREVWOwo+PiArCW9mX25vZGVfcHV0KG5wKTsKPj4gICAKPj4gICAJcGQg
PSBwbGF0Zm9ybV9kZXZpY2VfYWxsb2MoInBjc3BrciIsIC0xKTsKPj4gICAJaWYgKCFwZCkK
