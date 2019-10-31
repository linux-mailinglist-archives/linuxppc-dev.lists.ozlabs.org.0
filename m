Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB1EEAAA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 07:32:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473b9B60HpzF5KS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 17:32:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="1iqBC0jz"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473b6f54kbzF4KY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 17:30:33 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id t8so4416026otl.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 23:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/qgpzQ0JhjLVnJIOjjWL6Mowx327SPlx5pn1SoNDC+c=;
 b=1iqBC0jzqdA13DrnN43K3m1+K1ZNqhq6x3w5m8hY9nmbnUHOC0YmFxMimWdsAHYbnI
 Ft3Rhnr8sPfxIofC44Z/7Qrj4UgcXvACmnJp8eml2arLILt+rcSesmzbCxOvC50+LHHO
 DRsbi1+URJb3jRF4UQ489hhz9yx/vlAHsDk1NJuVPeke2fBxAofoORk7sCTY86yK9iov
 oI+I2WxAr10EvAm4jP5oXZzbFKSp1ClKqT3PJvht0xi7G3Ah9qNlEuxnXG/frHYS0Rzn
 nBdTpaYB4akqfyViaE/3xWJe1VWVmWbjSHsDKvUMpr5f1CosZc8fd527iFHZbuXM/3Mi
 1cMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/qgpzQ0JhjLVnJIOjjWL6Mowx327SPlx5pn1SoNDC+c=;
 b=JffWOUEUMKfem3++yjdaIMxoQOba7gDUh9tPQVbOoslnuurkVzqVPz2LCKtnCFys4U
 NmJsw3vl7WZPzgvSzpuj382hORLmo1R1w5hLgW0Uphx1DsHi7k9pOzTikkBfyy00ppsy
 rALCk85aP1hHmGh71kpsGzM+Mf9ZbsfygDW6FJ+SnWG5OlGaiDrLHxSSlUtcr/lVtEi0
 9paLAWkckrAx9VQtmM6qL99RHBv9Tgszz0yRmh+qYzjF9d9b7A0ODkxwsoqPPDjM+u7p
 kqcnQa20a/4uaN5dvDgB6Ptot/AxQd3NDpec0DlpbJBha3iUQq7nvg0D4QC+sM3tkpTO
 FrGg==
X-Gm-Message-State: APjAAAUcXRkbITUakSTrC9g17tWFdFBGk0AEResqZzQ8lz92IwEUwYfI
 fOpUrOSwoeunfErtMfmtc3kU1enbeKHR+qMZv3H0dw==
X-Google-Smtp-Source: APXvYqwsCcmEYbccy1+yhmtPx5o8k4Qn3ow1DuGI5ZSJal+v+fE3sTW9IHilS6kah7NkRLnkK2a0NND6knXg87rdbe4=
X-Received: by 2002:a05:6830:18d1:: with SMTP id
 v17mr2928239ote.71.1572503430036; 
 Wed, 30 Oct 2019 23:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191028094825.21448-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4gZ=wKzwscu_nch8VUtNTHusKzjmMhYZWo+Se=BPO9q8g@mail.gmail.com>
 <6f85f4af-788d-aaef-db64-ab8d3faf6b1b@linux.ibm.com>
 <CAPcyv4gMnSe26QfSBABx0zj3XuFqy=K1XaGnmE3h3sP3Y76nRw@mail.gmail.com>
 <4c6e5743-663e-853b-2203-15c809965965@linux.ibm.com>
In-Reply-To: <4c6e5743-663e-853b-2203-15c809965965@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 30 Oct 2019 23:30:19 -0700
Message-ID: <CAPcyv4h42_1deZDaaW1RqX0Ls+maiFO_1e=6xJuHTa3wdWvVvA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] libnvdimm/namespace: Make namespace size
 validation arch dependent
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 30, 2019 at 10:35 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
[..]
> > True, for the pfn device and the device-dax mapping size, but I'm
> > suggesting adding another instance of alignment control at the raw
> > namespace level. That would need to be disconnected from the
> > device-dax page mapping granularity.
> >
>
> Can you explain what you mean by raw namespace level ? We don't have
> multiple values against which we need to check the alignment of
> namespace start and namespace size.
>
> If you can outline how and where you would like to enforce that check I
> can start working on it.
>

What I mean is that the process of setting up a pfn namespace goes
something like this in shell script form:

1/ echo $size > /sys/bus/nd/devices/$namespace/size
2/ echo $namespace > /sys/bus/nd/devices/$pfn/namespace
3/ echo $pfn_align > /sys/bus/nd/devices/$pfn/align

What I'm suggesting is add an optional 0th step that does:

echo $raw_align > /sys/bus/nd/devices/$namespace/align

Where the raw align needs to be needs to be max($pfn_align,
arch_mapping_granulariy).

So on powerpc where PAGE_SIZE < arch_mapping_granulariy, the following:

cat /sys/bus/nd/devices/$namespace/supported_aligns

...would show the same output as:

cat /sys/bus/nd/devices/$pfn/align

...but with any alignment choice less than arch_mapping_granulariy removed.



All that said, the x86 vmemmap_populate() falls back to use small
pages in some case to get around this constraint. Can't powerpc do the
same? It would seem to be less work than the above proposal.
