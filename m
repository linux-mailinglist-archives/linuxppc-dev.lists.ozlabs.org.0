Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C33B1AD896
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 10:32:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493Tpz0RdZzDrT2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 18:32:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=mst@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=BQ5mBhFC; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=C9sJbd8x; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493TmV700xzDrPQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 18:30:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587112199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=927HTcDxS8YLKLHwy5cYRNn8yoWdBYpgBTBPkebognY=;
 b=BQ5mBhFCJ/ixHcDDeHIESLf6dQoTRW9XX54FD4TzUpFql9xEepDr5mSuuCU7Nlvl94j1js
 2zJj08QoZa7eN/XuHJoFB0HOgks5bvTVjYLtQQfvB5QwclQ5GnlLFJGegWK9azJWI9Ykyt
 Vd0Xh5yricu8mdN9JAYkIHru5b7dBVg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587112200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=927HTcDxS8YLKLHwy5cYRNn8yoWdBYpgBTBPkebognY=;
 b=C9sJbd8xGDt1SWoQicClVfpI6V++wi1rEVlpAX0C2iYyoG6g0cXuJVsKx2uYFc/7HqD6oo
 pJZlu3/0N03K1r+gBCBgjHQgr7RO+Lh5s+KdT0DLjnCiwx5qppFY4mVt4pGmYQMh6+him+
 JFJl720nFv7LP/0IQvL0o1enwOwcQsQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-LZzZIWXwOf-h3GC2qW9afA-1; Fri, 17 Apr 2020 04:29:56 -0400
X-MC-Unique: LZzZIWXwOf-h3GC2qW9afA-1
Received: by mail-wr1-f70.google.com with SMTP id m15so646678wrb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 01:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sq2go4oE4wkjjJo/d/qCXW8H/F2CZmjvC27LSvnbq6k=;
 b=ZL6ewIx4sPKq8u+FeoasGlDVZK8U3o6THhbVlSYuNB5/Kxc8Nv7RlX0IGP1OEuCi7J
 yQn+MpCk3YXT3IBDqT4Y1o51EuoYpZFjHcQMrgIvJ62uQmWw4ilHDChIsy2OuXK7FeR5
 uW/mGu9ROsPJg1ycg+FMmm8rQy73sfonAA69EB2ailNGYFHxiLVLJn+fceEQyu2+kHyq
 5wMwDsHME+jjcy1mcgfLEkjULKncxhceebB9Ga8DtlEzGRPjdmhnnZjh4YhyJ1+RLlmc
 HF/nrInLQMXUUk4IPh7nsu0HsAnott0wfyDI3TdegbH9ELYH66+kW97fMFzBXFEajTF1
 HKFA==
X-Gm-Message-State: AGi0PuYwGbnNbhRDHoTzsr8yNLwpQFLLn5H3IOPNCBZnFmk724ryv5RI
 iWQ83Ch0m6XR9rYtxod/fJb8+2ljN7maIs9hW3nRTWj8vLOPLpOJm7MKrJkFAEuAjmiiVCyhxwu
 p1acZUS6+Q5RWcfFo0iO/jqwncA==
X-Received: by 2002:a05:600c:2214:: with SMTP id
 z20mr2319812wml.189.1587112195127; 
 Fri, 17 Apr 2020 01:29:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypJKNV66xDbZPbEJ9pvldY03mzn5rKaoaGWZw2nM8sRe1qQQQA0lQolXxgIpPJn0ZvUYcb5Wmw==
X-Received: by 2002:a05:600c:2214:: with SMTP id
 z20mr2319790wml.189.1587112194907; 
 Fri, 17 Apr 2020 01:29:54 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id k133sm7277794wma.0.2020.04.17.01.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 01:29:54 -0700 (PDT)
Date: Fri, 17 Apr 2020 04:29:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
Message-ID: <20200417042912-mutt-send-email-mst@kernel.org>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: linux-s390@vger.kernel.org, tsbogend@alpha.franken.de, gor@linux.ibm.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, heiko.carstens@de.ibm.com,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, geert@linux-m68k.org, netdev@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 17, 2020 at 03:36:52PM +0800, Jason Wang wrote:
>=20
> On 2020/4/17 =E4=B8=8B=E5=8D=882:33, Michael S. Tsirkin wrote:
> > On Fri, Apr 17, 2020 at 11:12:14AM +0800, Jason Wang wrote:
> > > On 2020/4/17 =E4=B8=8A=E5=8D=886:55, Michael S. Tsirkin wrote:
> > > > On Wed, Apr 15, 2020 at 10:43:56AM +0800, Jason Wang wrote:
> > > > > We try to keep the defconfig untouched after decoupling CONFIG_VH=
OST
> > > > > out of CONFIG_VIRTUALIZATION in commit 20c384f1ea1a
> > > > > ("vhost: refine vhost and vringh kconfig") by enabling VHOST_MENU=
 by
> > > > > default. Then the defconfigs can keep enabling CONFIG_VHOST_NET
> > > > > without the caring of CONFIG_VHOST.
> > > > >=20
> > > > > But this will leave a "CONFIG_VHOST_MENU=3Dy" in all defconfigs a=
nd even
> > > > > for the ones that doesn't want vhost. So it actually shifts the
> > > > > burdens to the maintainers of all other to add "CONFIG_VHOST_MENU=
 is
> > > > > not set". So this patch tries to enable CONFIG_VHOST explicitly i=
n
> > > > > defconfigs that enables CONFIG_VHOST_NET and CONFIG_VHOST_VSOCK.
> > > > >=20
> > > > > Acked-by: Christian Borntraeger<borntraeger@de.ibm.com>  (s390)
> > > > > Acked-by: Michael Ellerman<mpe@ellerman.id.au>  (powerpc)
> > > > > Cc: Thomas Bogendoerfer<tsbogend@alpha.franken.de>
> > > > > Cc: Benjamin Herrenschmidt<benh@kernel.crashing.org>
> > > > > Cc: Paul Mackerras<paulus@samba.org>
> > > > > Cc: Michael Ellerman<mpe@ellerman.id.au>
> > > > > Cc: Heiko Carstens<heiko.carstens@de.ibm.com>
> > > > > Cc: Vasily Gorbik<gor@linux.ibm.com>
> > > > > Cc: Christian Borntraeger<borntraeger@de.ibm.com>
> > > > > Reported-by: Geert Uytterhoeven<geert@linux-m68k.org>
> > > > > Signed-off-by: Jason Wang<jasowang@redhat.com>
> > > > I rebased this on top of OABI fix since that
> > > > seems more orgent to fix.
> > > > Pushed to my vhost branch pls take a look and
> > > > if possible test.
> > > > Thanks!
> > >=20
> > > I test this patch by generating the defconfigs that wants vhost_net o=
r
> > > vhost_vsock. All looks fine.
> > >=20
> > > But having CONFIG_VHOST_DPN=3Dy may end up with the similar situation=
 that
> > > this patch want to address.
> > > Maybe we can let CONFIG_VHOST depends on !ARM || AEABI then add anoth=
er
> > > menuconfig for VHOST_RING and do something similar?
> > >=20
> > > Thanks
> > Sorry I don't understand. After this patch CONFIG_VHOST_DPN is just
> > an internal variable for the OABI fix. I kept it separate
> > so it's easy to revert for 5.8. Yes we could squash it into
> > VHOST directly but I don't see how that changes logic at all.
>=20
>=20
> Sorry for being unclear.
>=20
> I meant since it was enabled by default, "CONFIG_VHOST_DPN=3Dy" will be l=
eft
> in the defconfigs.

But who cares? That does not add any code, does it?

> This requires the arch maintainers to add
> "CONFIG_VHOST_VDPN is not set". (Geert complains about this)
>=20
> Thanks
>=20
>=20
> >=20

