Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7680B8CA33
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 06:24:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467c0z720gzDqZV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 14:24:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="lSBnrS8t"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467bzJ2T5KzDqM9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 14:22:45 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id j7so34577066ota.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 21:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zoXGQBGajDQxezNNcS/cjA+hWeq0IRMj0Pc+wThq1Uc=;
 b=lSBnrS8tqiiijjKBaq3D6j67zO0EUnDB502LMET/5F5yegb6JeqsedLaLMfOo63r8S
 EcrJrdYWbzMyX+10KICG5aZr+4bzh0NgZ5Y4mEVePzjP6/Vlyq8bfrk0rQwWY5PXfdna
 I4QSitZLXK/iqFeNnbt8MLLfb3kub2r9klrPTxFMgry+e8tcD3KF+5UeW25LxdzSWArr
 4su5hJ68oi+JWOkGBqfKtNKQEP7zmHAc1wdlv+GGlYtkd+nl8RvCtycopJ7cfhiuMDaE
 UDrX7cdFchaHWpYcfWwisvrX4/Nq8+rkCikI9rfldZv6Cg/CeTKSYqIWNBjBbuin1GIn
 ZglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zoXGQBGajDQxezNNcS/cjA+hWeq0IRMj0Pc+wThq1Uc=;
 b=sYiFbavfgbwEK2Ic9HZpZL7N2PL/fz6LODoBVUViacLMSacRmhvi8iHHtUWHW8DEQ4
 ClTc7PE+iTFSdHAQOvIQFe8EKncA/Qpp7SnXI1P4UW3BMpamnjRHTokclKAsBISMLtJm
 SUPgs86+9lyyySunARdK6gb/Rmgu6mIgY7XrIfLaUpfg+yO32lAWfCK2DfsuKt6soF7c
 THIm6a3aVYabKjOyqaHUpnH1EzKv79sabj6MAxRdLaKeCAKSdUWn/C/IdiIz9kef8Van
 We5JIlEi/1NQENR7DT0rpPp1jKkZZfvjFf8HPw2uULq+c84lIomicY11IsCw8Tq74euD
 oPzg==
X-Gm-Message-State: APjAAAUPufC5t5QT0x2J0JgUYrIfbIBzs0YFq5NR5gE0oNXBbmf7Opns
 E81FhQdooaUY8IWtOBbTwFD2jcgozPA+2karuj7PHA==
X-Google-Smtp-Source: APXvYqxU9+/oQ4EeFHIM0EUbMXl8sa9JCmg5t1iaQuAoWLI6wguDkMy5yQbQgHz3SJfsIxx8VS/lgth09CwAzBuHkrE=
X-Received: by 2002:a05:6830:1e05:: with SMTP id
 s5mr21695006otr.247.1565756563197; 
 Tue, 13 Aug 2019 21:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190809074520.27115-1-aneesh.kumar@linux.ibm.com>
 <20190809074520.27115-2-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190809074520.27115-2-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 13 Aug 2019 21:22:30 -0700
Message-ID: <CAPcyv4jmxKPkTh0_Bbu2tRXm4vcBHonZJ6UcKrOBnPGCG2_i1A@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] nvdimm: Consider probe return -EOPNOTSUPP as
 success
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: multipart/mixed; boundary="000000000000c1590c05900c1b78"
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
Cc: Linux MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000c1590c05900c1b78
Content-Type: text/plain; charset="UTF-8"

Hi Aneesh, logic looks correct but there are some cleanups I'd like to
see and a lead-in patch that I attached.

I've started prefixing nvdimm patches with:

    libnvdimm/$component:

...since this patch mostly impacts the pmem driver lets prefix it
"libnvdimm/pmem: "

On Fri, Aug 9, 2019 at 12:45 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> This patch add -EOPNOTSUPP as return from probe callback to

s/This patch add/Add/

No need to say "this patch" it's obviously a patch.

> indicate we were not able to initialize a namespace due to pfn superblock
> feature/version mismatch. We want to consider this a probe success so that
> we can create new namesapce seed and there by avoid marking the failed
> namespace as the seed namespace.

Please replace usage of "we" with the exact agent involved as which
"we" is being referred to gets confusing for the reader.

i.e. "indicate that the pmem driver was not..." "The nvdimm core wants
to consider this...".

>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  drivers/nvdimm/bus.c  |  2 +-
>  drivers/nvdimm/pmem.c | 26 ++++++++++++++++++++++----
>  2 files changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/nvdimm/bus.c b/drivers/nvdimm/bus.c
> index 798c5c4aea9c..16c35e6446a7 100644
> --- a/drivers/nvdimm/bus.c
> +++ b/drivers/nvdimm/bus.c
> @@ -95,7 +95,7 @@ static int nvdimm_bus_probe(struct device *dev)
>         rc = nd_drv->probe(dev);
>         debug_nvdimm_unlock(dev);
>
> -       if (rc == 0)
> +       if (rc == 0 || rc == -EOPNOTSUPP)
>                 nd_region_probe_success(nvdimm_bus, dev);

This now makes the nd_region_probe_success() helper obviously misnamed
since it now wants to take actions on non-probe success. I attached a
lead-in cleanup that you can pull into your series that renames that
routine to nd_region_advance_seeds().

When you rebase this needs a comment about why EOPNOTSUPP has special handling.

>         else
>                 nd_region_disable(nvdimm_bus, dev);
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index 4c121dd03dd9..3f498881dd28 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -490,6 +490,7 @@ static int pmem_attach_disk(struct device *dev,
>
>  static int nd_pmem_probe(struct device *dev)
>  {
> +       int ret;
>         struct nd_namespace_common *ndns;
>
>         ndns = nvdimm_namespace_common_probe(dev);
> @@ -505,12 +506,29 @@ static int nd_pmem_probe(struct device *dev)
>         if (is_nd_pfn(dev))
>                 return pmem_attach_disk(dev, ndns);
>
> -       /* if we find a valid info-block we'll come back as that personality */
> -       if (nd_btt_probe(dev, ndns) == 0 || nd_pfn_probe(dev, ndns) == 0
> -                       || nd_dax_probe(dev, ndns) == 0)

Similar need for an updated comment here to explain the special
translation of error codes.

> +       ret = nd_btt_probe(dev, ndns);
> +       if (ret == 0)
>                 return -ENXIO;
> +       else if (ret == -EOPNOTSUPP)

Are there cases where the btt driver needs to return EOPNOTSUPP? I'd
otherwise like to keep this special casing constrained to the pfn /
dax info block cases.

--000000000000c1590c05900c1b78
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-libnvdimm-region-Rewrite-_probe_success-to-_advance_.patch"
Content-Disposition: attachment; 
	filename="0001-libnvdimm-region-Rewrite-_probe_success-to-_advance_.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jzar0kti0>
X-Attachment-Id: f_jzar0kti0

RnJvbSA5ZWMxM2E4NjcyZTg3ZTBiMWM1Yjk0MjdhYjkyNjE2OGU1M2Q1NWJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNv
bT4KRGF0ZTogVHVlLCAxMyBBdWcgMjAxOSAxMzowOToyNyAtMDcwMApTdWJqZWN0OiBbUEFUQ0hd
IGxpYm52ZGltbS9yZWdpb246IFJld3JpdGUgX3Byb2JlX3N1Y2Nlc3MoKSB0bwogX2FkdmFuY2Vf
c2VlZHMoKQoKVGhlIG5kX3JlZ2lvbl9wcm9iZV9zdWNjZXNzKCkgaGVscGVyIGNvbGxpZGVzIHNl
ZWQgbWFuYWdlbWVudCB3aXRoCm52ZGltbS0+YnVzeSB0cmFja2luZy4gR2l2ZW4gdGhlICdidXN5
JyBpbmNyZW1lbnQgaXMgaGFuZGxlZCBpbnRlcm5hbCB0byB0aGUKbmRfcmVnaW9uIGRyaXZlciAn
cHJvYmUnIHBhdGggbW92ZSB0aGUgZGVjcmVtZW50IHRvIHRoZSAncmVtb3ZlJyBwYXRoLgpXaXRo
IHRoYXQgY2xlYW51cCB0aGUgcm91dGluZSBjYW4gYmUgcmVuYW1lZCB0byB0aGUgbW9yZSBkZXNj
cmlwdGl2ZQpuZF9yZWdpb25fYWR2YW5jZV9zZWVkcygpLgoKVGhlIGNoYW5nZSBpcyBwcm9tcHRl
ZCBieSBhbiBpbmNvbWluZyBuZWVkIHRvIG9wdGlvbmFsbHkgYWR2YW5jZSB0aGUKc2VlZHMgb24g
b3RoZXIgZXZlbnRzIGJlc2lkZXMgJ3Byb2JlJyBzdWNjZXNzLgoKQ2M6ICJBbmVlc2ggS3VtYXIg
Sy5WIiA8YW5lZXNoLmt1bWFyQGxpbnV4LmlibS5jb20+ClNpZ25lZC1vZmYtYnk6IERhbiBXaWxs
aWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvbnZkaW1tL2J1cy5j
ICAgICAgICAgICAgfCAgNyArLS0tCiBkcml2ZXJzL252ZGltbS9uYW1lc3BhY2VfZGV2cy5jIHwg
MzQgKysrKysrKysrKysrKystLS0KIGRyaXZlcnMvbnZkaW1tL25kLWNvcmUuaCAgICAgICAgfCAg
MyArLQogZHJpdmVycy9udmRpbW0vcmVnaW9uX2RldnMuYyAgICB8IDY4ICsrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCA3
MSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL252ZGltbS9idXMuYyBiL2RyaXZl
cnMvbnZkaW1tL2J1cy5jCmluZGV4IDI5NDc5ZDNiMDFiMC4uZWU2ZGUzNGFlNTI1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL252ZGltbS9idXMuYworKysgYi9kcml2ZXJzL252ZGltbS9idXMuYwpAQCAt
OTUsMTAgKzk1LDggQEAgc3RhdGljIGludCBudmRpbW1fYnVzX3Byb2JlKHN0cnVjdCBkZXZpY2Ug
KmRldikKIAlyYyA9IG5kX2Rydi0+cHJvYmUoZGV2KTsKIAlkZWJ1Z19udmRpbW1fdW5sb2NrKGRl
dik7CiAKLQlpZiAocmMgPT0gMCkKLQkJbmRfcmVnaW9uX3Byb2JlX3N1Y2Nlc3MobnZkaW1tX2J1
cywgZGV2KTsKLQllbHNlCi0JCW5kX3JlZ2lvbl9kaXNhYmxlKG52ZGltbV9idXMsIGRldik7CisJ
aWYgKHJjID09IDAgJiYgZGV2LT5wYXJlbnQgJiYgaXNfbmRfcmVnaW9uKGRldi0+cGFyZW50KSkK
KwkJbmRfcmVnaW9uX2FkdmFuY2Vfc2VlZHModG9fbmRfcmVnaW9uKGRldi0+cGFyZW50KSwgZGV2
KTsKIAludmRpbW1fYnVzX3Byb2JlX2VuZChudmRpbW1fYnVzKTsKIAogCWRldl9kYmcoJm52ZGlt
bV9idXMtPmRldiwgIkVORDogJXMucHJvYmUoJXMpID0gJWRcbiIsIGRldi0+ZHJpdmVyLT5uYW1l
LApAQCAtMTIxLDcgKzExOSw2IEBAIHN0YXRpYyBpbnQgbnZkaW1tX2J1c19yZW1vdmUoc3RydWN0
IGRldmljZSAqZGV2KQogCQlyYyA9IG5kX2Rydi0+cmVtb3ZlKGRldik7CiAJCWRlYnVnX252ZGlt
bV91bmxvY2soZGV2KTsKIAl9Ci0JbmRfcmVnaW9uX2Rpc2FibGUobnZkaW1tX2J1cywgZGV2KTsK
IAogCWRldl9kYmcoJm52ZGltbV9idXMtPmRldiwgIiVzLnJlbW92ZSglcykgPSAlZFxuIiwgZGV2
LT5kcml2ZXItPm5hbWUsCiAJCQlkZXZfbmFtZShkZXYpLCByYyk7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL252ZGltbS9uYW1lc3BhY2VfZGV2cy5jIGIvZHJpdmVycy9udmRpbW0vbmFtZXNwYWNlX2Rl
dnMuYwppbmRleCBhMTZlNTIyNTFhMzAuLjNiZTgxZjdiOWVkMyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9udmRpbW0vbmFtZXNwYWNlX2RldnMuYworKysgYi9kcml2ZXJzL252ZGltbS9uYW1lc3BhY2Vf
ZGV2cy5jCkBAIC0yNDYyLDYgKzI0NjIsMjcgQEAgc3RhdGljIHN0cnVjdCBkZXZpY2UgKipjcmVh
dGVfbmFtZXNwYWNlcyhzdHJ1Y3QgbmRfcmVnaW9uICpuZF9yZWdpb24pCiAJcmV0dXJuIGRldnM7
CiB9CiAKK3N0YXRpYyB2b2lkIGRlYWN0aXZhdGVfbGFiZWxzKHZvaWQgKnJlZ2lvbikKK3sKKwlz
dHJ1Y3QgbmRfcmVnaW9uICpuZF9yZWdpb24gPSByZWdpb247CisJaW50IGk7CisKKwlmb3IgKGkg
PSAwOyBpIDwgbmRfcmVnaW9uLT5uZHJfbWFwcGluZ3M7IGkrKykgeworCQlzdHJ1Y3QgbmRfbWFw
cGluZyAqbmRfbWFwcGluZyA9ICZuZF9yZWdpb24tPm1hcHBpbmdbaV07CisJCXN0cnVjdCBudmRp
bW1fZHJ2ZGF0YSAqbmRkID0gbmRfbWFwcGluZy0+bmRkOworCQlzdHJ1Y3QgbnZkaW1tICpudmRp
bW0gPSBuZF9tYXBwaW5nLT5udmRpbW07CisKKwkJbXV0ZXhfbG9jaygmbmRfbWFwcGluZy0+bG9j
ayk7CisJCW5kX21hcHBpbmdfZnJlZV9sYWJlbHMobmRfbWFwcGluZyk7CisJCW11dGV4X3VubG9j
aygmbmRfbWFwcGluZy0+bG9jayk7CisKKwkJcHV0X25kZChuZGQpOworCQluZF9tYXBwaW5nLT5u
ZGQgPSBOVUxMOworCQlpZiAobmRkKQorCQkJYXRvbWljX2RlYygmbnZkaW1tLT5idXN5KTsKKwl9
Cit9CisKIHN0YXRpYyBpbnQgaW5pdF9hY3RpdmVfbGFiZWxzKHN0cnVjdCBuZF9yZWdpb24gKm5k
X3JlZ2lvbikKIHsKIAlpbnQgaTsKQEAgLTI1MTksMTYgKzI1NDAsMTcgQEAgc3RhdGljIGludCBp
bml0X2FjdGl2ZV9sYWJlbHMoc3RydWN0IG5kX3JlZ2lvbiAqbmRfcmVnaW9uKQogCQkJbXV0ZXhf
dW5sb2NrKCZuZF9tYXBwaW5nLT5sb2NrKTsKIAkJfQogCi0JCWlmIChqID49IGNvdW50KQotCQkJ
Y29udGludWU7CisJCWlmIChqIDwgY291bnQpCisJCQlicmVhazsKKwl9CiAKLQkJbXV0ZXhfbG9j
aygmbmRfbWFwcGluZy0+bG9jayk7Ci0JCW5kX21hcHBpbmdfZnJlZV9sYWJlbHMobmRfbWFwcGlu
Zyk7Ci0JCW11dGV4X3VubG9jaygmbmRfbWFwcGluZy0+bG9jayk7CisJaWYgKGkgPCBuZF9yZWdp
b24tPm5kcl9tYXBwaW5ncykgeworCQlkZWFjdGl2YXRlX2xhYmVscyhuZF9yZWdpb24pOwogCQly
ZXR1cm4gLUVOT01FTTsKIAl9CiAKLQlyZXR1cm4gMDsKKwlyZXR1cm4gZGV2bV9hZGRfYWN0aW9u
X29yX3Jlc2V0KCZuZF9yZWdpb24tPmRldiwgZGVhY3RpdmF0ZV9sYWJlbHMsCisJCQluZF9yZWdp
b24pOwogfQogCiBpbnQgbmRfcmVnaW9uX3JlZ2lzdGVyX25hbWVzcGFjZXMoc3RydWN0IG5kX3Jl
Z2lvbiAqbmRfcmVnaW9uLCBpbnQgKmVycikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZkaW1tL25k
LWNvcmUuaCBiL2RyaXZlcnMvbnZkaW1tL25kLWNvcmUuaAppbmRleCA0NTQ0NTRiYTE3MzguLjI1
ZmExMjExMDRkMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9udmRpbW0vbmQtY29yZS5oCisrKyBiL2Ry
aXZlcnMvbnZkaW1tL25kLWNvcmUuaApAQCAtMTE1LDEzICsxMTUsMTIgQEAgaW50IF9faW5pdCBu
dmRpbW1fYnVzX2luaXQodm9pZCk7CiB2b2lkIG52ZGltbV9idXNfZXhpdCh2b2lkKTsKIHZvaWQg
bnZkaW1tX2RldnNfZXhpdCh2b2lkKTsKIHZvaWQgbmRfcmVnaW9uX2RldnNfZXhpdCh2b2lkKTsK
LXZvaWQgbmRfcmVnaW9uX3Byb2JlX3N1Y2Nlc3Moc3RydWN0IG52ZGltbV9idXMgKm52ZGltbV9i
dXMsIHN0cnVjdCBkZXZpY2UgKmRldik7CiBzdHJ1Y3QgbmRfcmVnaW9uOwordm9pZCBuZF9yZWdp
b25fYWR2YW5jZV9zZWVkcyhzdHJ1Y3QgbmRfcmVnaW9uICpuZF9yZWdpb24sIHN0cnVjdCBkZXZp
Y2UgKmRldik7CiB2b2lkIG5kX3JlZ2lvbl9jcmVhdGVfbnNfc2VlZChzdHJ1Y3QgbmRfcmVnaW9u
ICpuZF9yZWdpb24pOwogdm9pZCBuZF9yZWdpb25fY3JlYXRlX2J0dF9zZWVkKHN0cnVjdCBuZF9y
ZWdpb24gKm5kX3JlZ2lvbik7CiB2b2lkIG5kX3JlZ2lvbl9jcmVhdGVfcGZuX3NlZWQoc3RydWN0
IG5kX3JlZ2lvbiAqbmRfcmVnaW9uKTsKIHZvaWQgbmRfcmVnaW9uX2NyZWF0ZV9kYXhfc2VlZChz
dHJ1Y3QgbmRfcmVnaW9uICpuZF9yZWdpb24pOwotdm9pZCBuZF9yZWdpb25fZGlzYWJsZShzdHJ1
Y3QgbnZkaW1tX2J1cyAqbnZkaW1tX2J1cywgc3RydWN0IGRldmljZSAqZGV2KTsKIGludCBudmRp
bW1fYnVzX2NyZWF0ZV9uZGN0bChzdHJ1Y3QgbnZkaW1tX2J1cyAqbnZkaW1tX2J1cyk7CiB2b2lk
IG52ZGltbV9idXNfZGVzdHJveV9uZGN0bChzdHJ1Y3QgbnZkaW1tX2J1cyAqbnZkaW1tX2J1cyk7
CiB2b2lkIG5kX3N5bmNocm9uaXplKHZvaWQpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9udmRpbW0v
cmVnaW9uX2RldnMuYyBiL2RyaXZlcnMvbnZkaW1tL3JlZ2lvbl9kZXZzLmMKaW5kZXggYWYzMGNi
ZTdhOGVhLi41N2RlNDliNzlkN2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbnZkaW1tL3JlZ2lvbl9k
ZXZzLmMKKysrIGIvZHJpdmVycy9udmRpbW0vcmVnaW9uX2RldnMuYwpAQCAtNzE1LDg1ICs3MTUs
MzcgQEAgdm9pZCBuZF9tYXBwaW5nX2ZyZWVfbGFiZWxzKHN0cnVjdCBuZF9tYXBwaW5nICpuZF9t
YXBwaW5nKQogfQogCiAvKgotICogVXBvbiBzdWNjZXNzZnVsIHByb2JlL3JlbW92ZSwgdGFrZS9y
ZWxlYXNlIGEgcmVmZXJlbmNlIG9uIHRoZQotICogYXNzb2NpYXRlZCBpbnRlcmxlYXZlIHNldCAo
aWYgcHJlc2VudCksIGFuZCBwbGFudCBuZXcgYnR0ICsgbmFtZXNwYWNlCi0gKiBzZWVkcy4gIEFs
c28sIG9uIHRoZSByZW1vdmFsIG9mIGEgQkxLIHJlZ2lvbiwgbm90aWZ5IHRoZSBwcm92aWRlciB0
bwotICogZGlzYWJsZSB0aGUgcmVnaW9uLgorICogV2hlbiBhIG5hbWVzcGFjZSBpcyBhY3RpdmF0
ZWQgY3JlYXRlIG5ldyBzZWVkcyBmb3IgdGhlIG5leHQKKyAqIG5hbWVzcGFjZSwgb3IgbmFtZXNw
YWNlLXBlcnNvbmFsaXR5IHRvIGJlIGNvbmZpZ3VyZWQuCiAgKi8KLXN0YXRpYyB2b2lkIG5kX3Jl
Z2lvbl9ub3RpZnlfZHJpdmVyX2FjdGlvbihzdHJ1Y3QgbnZkaW1tX2J1cyAqbnZkaW1tX2J1cywK
LQkJc3RydWN0IGRldmljZSAqZGV2LCBib29sIHByb2JlKQordm9pZCBuZF9yZWdpb25fYWR2YW5j
ZV9zZWVkcyhzdHJ1Y3QgbmRfcmVnaW9uICpuZF9yZWdpb24sIHN0cnVjdCBkZXZpY2UgKmRldikK
IHsKLQlzdHJ1Y3QgbmRfcmVnaW9uICpuZF9yZWdpb247Ci0KLQlpZiAoIXByb2JlICYmIGlzX25k
X3JlZ2lvbihkZXYpKSB7Ci0JCWludCBpOwotCi0JCW5kX3JlZ2lvbiA9IHRvX25kX3JlZ2lvbihk
ZXYpOwotCQlmb3IgKGkgPSAwOyBpIDwgbmRfcmVnaW9uLT5uZHJfbWFwcGluZ3M7IGkrKykgewot
CQkJc3RydWN0IG5kX21hcHBpbmcgKm5kX21hcHBpbmcgPSAmbmRfcmVnaW9uLT5tYXBwaW5nW2ld
OwotCQkJc3RydWN0IG52ZGltbV9kcnZkYXRhICpuZGQgPSBuZF9tYXBwaW5nLT5uZGQ7Ci0JCQlz
dHJ1Y3QgbnZkaW1tICpudmRpbW0gPSBuZF9tYXBwaW5nLT5udmRpbW07Ci0KLQkJCW11dGV4X2xv
Y2soJm5kX21hcHBpbmctPmxvY2spOwotCQkJbmRfbWFwcGluZ19mcmVlX2xhYmVscyhuZF9tYXBw
aW5nKTsKLQkJCW11dGV4X3VubG9jaygmbmRfbWFwcGluZy0+bG9jayk7Ci0KLQkJCXB1dF9uZGQo
bmRkKTsKLQkJCW5kX21hcHBpbmctPm5kZCA9IE5VTEw7Ci0JCQlpZiAobmRkKQotCQkJCWF0b21p
Y19kZWMoJm52ZGltbS0+YnVzeSk7Ci0JCX0KLQl9Ci0JaWYgKGRldi0+cGFyZW50ICYmIGlzX25k
X3JlZ2lvbihkZXYtPnBhcmVudCkgJiYgcHJvYmUpIHsKLQkJbmRfcmVnaW9uID0gdG9fbmRfcmVn
aW9uKGRldi0+cGFyZW50KTsKLQkJbnZkaW1tX2J1c19sb2NrKGRldik7Ci0JCWlmIChuZF9yZWdp
b24tPm5zX3NlZWQgPT0gZGV2KQotCQkJbmRfcmVnaW9uX2NyZWF0ZV9uc19zZWVkKG5kX3JlZ2lv
bik7Ci0JCW52ZGltbV9idXNfdW5sb2NrKGRldik7Ci0JfQotCWlmIChpc19uZF9idHQoZGV2KSAm
JiBwcm9iZSkgeworCW52ZGltbV9idXNfbG9jayhkZXYpOworCWlmIChuZF9yZWdpb24tPm5zX3Nl
ZWQgPT0gZGV2KSB7CisJCW5kX3JlZ2lvbl9jcmVhdGVfbnNfc2VlZChuZF9yZWdpb24pOworCX0g
ZWxzZSBpZiAoaXNfbmRfYnR0KGRldikpIHsKIAkJc3RydWN0IG5kX2J0dCAqbmRfYnR0ID0gdG9f
bmRfYnR0KGRldik7CiAKLQkJbmRfcmVnaW9uID0gdG9fbmRfcmVnaW9uKGRldi0+cGFyZW50KTsK
LQkJbnZkaW1tX2J1c19sb2NrKGRldik7CiAJCWlmIChuZF9yZWdpb24tPmJ0dF9zZWVkID09IGRl
dikKIAkJCW5kX3JlZ2lvbl9jcmVhdGVfYnR0X3NlZWQobmRfcmVnaW9uKTsKIAkJaWYgKG5kX3Jl
Z2lvbi0+bnNfc2VlZCA9PSAmbmRfYnR0LT5uZG5zLT5kZXYpCiAJCQluZF9yZWdpb25fY3JlYXRl
X25zX3NlZWQobmRfcmVnaW9uKTsKLQkJbnZkaW1tX2J1c191bmxvY2soZGV2KTsKLQl9Ci0JaWYg
KGlzX25kX3BmbihkZXYpICYmIHByb2JlKSB7CisJfSBlbHNlIGlmIChpc19uZF9wZm4oZGV2KSkg
ewogCQlzdHJ1Y3QgbmRfcGZuICpuZF9wZm4gPSB0b19uZF9wZm4oZGV2KTsKIAotCQluZF9yZWdp
b24gPSB0b19uZF9yZWdpb24oZGV2LT5wYXJlbnQpOwotCQludmRpbW1fYnVzX2xvY2soZGV2KTsK
IAkJaWYgKG5kX3JlZ2lvbi0+cGZuX3NlZWQgPT0gZGV2KQogCQkJbmRfcmVnaW9uX2NyZWF0ZV9w
Zm5fc2VlZChuZF9yZWdpb24pOwogCQlpZiAobmRfcmVnaW9uLT5uc19zZWVkID09ICZuZF9wZm4t
Pm5kbnMtPmRldikKIAkJCW5kX3JlZ2lvbl9jcmVhdGVfbnNfc2VlZChuZF9yZWdpb24pOwotCQlu
dmRpbW1fYnVzX3VubG9jayhkZXYpOwotCX0KLQlpZiAoaXNfbmRfZGF4KGRldikgJiYgcHJvYmUp
IHsKKwl9IGVsc2UgaWYgKGlzX25kX2RheChkZXYpKSB7CiAJCXN0cnVjdCBuZF9kYXggKm5kX2Rh
eCA9IHRvX25kX2RheChkZXYpOwogCi0JCW5kX3JlZ2lvbiA9IHRvX25kX3JlZ2lvbihkZXYtPnBh
cmVudCk7Ci0JCW52ZGltbV9idXNfbG9jayhkZXYpOwogCQlpZiAobmRfcmVnaW9uLT5kYXhfc2Vl
ZCA9PSBkZXYpCiAJCQluZF9yZWdpb25fY3JlYXRlX2RheF9zZWVkKG5kX3JlZ2lvbik7CiAJCWlm
IChuZF9yZWdpb24tPm5zX3NlZWQgPT0gJm5kX2RheC0+bmRfcGZuLm5kbnMtPmRldikKIAkJCW5k
X3JlZ2lvbl9jcmVhdGVfbnNfc2VlZChuZF9yZWdpb24pOwotCQludmRpbW1fYnVzX3VubG9jayhk
ZXYpOwogCX0KLX0KLQotdm9pZCBuZF9yZWdpb25fcHJvYmVfc3VjY2VzcyhzdHJ1Y3QgbnZkaW1t
X2J1cyAqbnZkaW1tX2J1cywgc3RydWN0IGRldmljZSAqZGV2KQotewotCW5kX3JlZ2lvbl9ub3Rp
ZnlfZHJpdmVyX2FjdGlvbihudmRpbW1fYnVzLCBkZXYsIHRydWUpOwotfQotCi12b2lkIG5kX3Jl
Z2lvbl9kaXNhYmxlKHN0cnVjdCBudmRpbW1fYnVzICpudmRpbW1fYnVzLCBzdHJ1Y3QgZGV2aWNl
ICpkZXYpCi17Ci0JbmRfcmVnaW9uX25vdGlmeV9kcml2ZXJfYWN0aW9uKG52ZGltbV9idXMsIGRl
diwgZmFsc2UpOworCW52ZGltbV9idXNfdW5sb2NrKGRldik7CiB9CiAKIHN0YXRpYyBzc2l6ZV90
IG1hcHBpbmdOKHN0cnVjdCBkZXZpY2UgKmRldiwgY2hhciAqYnVmLCBpbnQgbikKLS0gCjIuMjAu
MQoK
--000000000000c1590c05900c1b78--
