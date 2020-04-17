Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E59B31AD8E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 10:48:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493V9C6tWQzDrck
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 18:47:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-1.mimecast.com; envelope-from=mst@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ZdpkFpJ4; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=HFq6CJG0; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493V7H4XgQzDrQT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 18:46:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587113176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ML3zrr9sQsBri4c7+JgTB25GKE22P30zFWuVY1tR9Z4=;
 b=ZdpkFpJ43RHhfnCM9er+17pMBIdM6qqpO9qyqSLgYJ50OSH9CzDodbFKTZnpmxulYhMa5q
 yE8GFVkSqbMlGG2SK+RrtmXfT7ViVHr0e6NiuJ9HRIOUTPmXnKEMyqf1xdOny9HLpj8G4/
 +vm0pBk3Sid9RMeC7GPVMETtfakJsBM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587113177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ML3zrr9sQsBri4c7+JgTB25GKE22P30zFWuVY1tR9Z4=;
 b=HFq6CJG066gnrMnPyQMn6ngRAPYPMcCbtACXBn6HnQNX5g3mvA6trWaHo4OyFsx7os4FTG
 MFW9CkN6RtJSJNd2klD3CqnrP9ApnFMpJoJEhhUgjw8s55hXsSaDXauhudY3GPXJofOgFQ
 knvcdKg+TeZBQCh0r69vj6h9X5WvGNs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-HCGHHg0pNfm5DDx1lZ7VWg-1; Fri, 17 Apr 2020 04:46:15 -0400
X-MC-Unique: HCGHHg0pNfm5DDx1lZ7VWg-1
Received: by mail-wr1-f70.google.com with SMTP id o10so649968wrj.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 01:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wE/WARZLg+d1WCxCwrHkOlSrWaAPnJuSBoxihd1UamI=;
 b=Ut7TSYNakW76MqdoIHeoA6dCJDSjjZjpNb9tjystHSN9trhTiVmbBHVdNlLAjHwgU5
 afmVk05kK4V7UcgCf6P4oSffIOwEPyCb3Rge4H1m+DN/UF3PS+qy+6/xzegZnBxmmdJF
 wJAuVJ0WGb1qy5Mi8fEiz6Cary8fzCw96QPIJ3vCd/Knr7FETRIhNM9OeRHvFoUarpfP
 LpSf3AusCllbxiNlPbX5y5q4kXgGiV2C/Dyn4XoGPgPh+R0MYZDNQbUXWdf2f9yLQt9m
 sX0Xzy0ojBal0tmfCoIIAALVEkKOQVBogflNhDDj4yIaEF6TpTpNwaNmkYsFyGj3qa3g
 h7zg==
X-Gm-Message-State: AGi0PuaB9+NF1PFKpevlr99mEvEc05kWQmsjVCDfZY4jgL4WJGCIACCc
 uag9u7qvSeGsUEpLUWtiDjXHkizztiRmeNCG43F0ueb8eoA2Lpqtphcxf1aQgS3ckCNwIifUrOL
 olJi+yCqsmYSm463BT2ADB2IwcA==
X-Received: by 2002:a1c:3b0a:: with SMTP id i10mr2207011wma.26.1587113173861; 
 Fri, 17 Apr 2020 01:46:13 -0700 (PDT)
X-Google-Smtp-Source: APiQypL7wwVAY2VUk1Sf/olefVQONEzwVRmuwANF/2eIBwUJQiUqpjYTnQ3meLl2WX6+2mTArW0sHw==
X-Received: by 2002:a1c:3b0a:: with SMTP id i10mr2206989wma.26.1587113173640; 
 Fri, 17 Apr 2020 01:46:13 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id l5sm31065502wrm.66.2020.04.17.01.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 01:46:13 -0700 (PDT)
Date: Fri, 17 Apr 2020 04:46:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
Message-ID: <20200417044230-mutt-send-email-mst@kernel.org>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
 <20200417042912-mutt-send-email-mst@kernel.org>
 <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
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

On Fri, Apr 17, 2020 at 04:39:49PM +0800, Jason Wang wrote:
>=20
> On 2020/4/17 =E4=B8=8B=E5=8D=884:29, Michael S. Tsirkin wrote:
> > On Fri, Apr 17, 2020 at 03:36:52PM +0800, Jason Wang wrote:
> > > On 2020/4/17 =E4=B8=8B=E5=8D=882:33, Michael S. Tsirkin wrote:
> > > > On Fri, Apr 17, 2020 at 11:12:14AM +0800, Jason Wang wrote:
> > > > > On 2020/4/17 =E4=B8=8A=E5=8D=886:55, Michael S. Tsirkin wrote:
> > > > > > On Wed, Apr 15, 2020 at 10:43:56AM +0800, Jason Wang wrote:
> > > > > > > We try to keep the defconfig untouched after decoupling CONFI=
G_VHOST
> > > > > > > out of CONFIG_VIRTUALIZATION in commit 20c384f1ea1a
> > > > > > > ("vhost: refine vhost and vringh kconfig") by enabling VHOST_=
MENU by
> > > > > > > default. Then the defconfigs can keep enabling CONFIG_VHOST_N=
ET
> > > > > > > without the caring of CONFIG_VHOST.
> > > > > > >=20
> > > > > > > But this will leave a "CONFIG_VHOST_MENU=3Dy" in all defconfi=
gs and even
> > > > > > > for the ones that doesn't want vhost. So it actually shifts t=
he
> > > > > > > burdens to the maintainers of all other to add "CONFIG_VHOST_=
MENU is
> > > > > > > not set". So this patch tries to enable CONFIG_VHOST explicit=
ly in
> > > > > > > defconfigs that enables CONFIG_VHOST_NET and CONFIG_VHOST_VSO=
CK.
> > > > > > >=20
> > > > > > > Acked-by: Christian Borntraeger<borntraeger@de.ibm.com>  (s39=
0)
> > > > > > > Acked-by: Michael Ellerman<mpe@ellerman.id.au>  (powerpc)
> > > > > > > Cc: Thomas Bogendoerfer<tsbogend@alpha.franken.de>
> > > > > > > Cc: Benjamin Herrenschmidt<benh@kernel.crashing.org>
> > > > > > > Cc: Paul Mackerras<paulus@samba.org>
> > > > > > > Cc: Michael Ellerman<mpe@ellerman.id.au>
> > > > > > > Cc: Heiko Carstens<heiko.carstens@de.ibm.com>
> > > > > > > Cc: Vasily Gorbik<gor@linux.ibm.com>
> > > > > > > Cc: Christian Borntraeger<borntraeger@de.ibm.com>
> > > > > > > Reported-by: Geert Uytterhoeven<geert@linux-m68k.org>
> > > > > > > Signed-off-by: Jason Wang<jasowang@redhat.com>
> > > > > > I rebased this on top of OABI fix since that
> > > > > > seems more orgent to fix.
> > > > > > Pushed to my vhost branch pls take a look and
> > > > > > if possible test.
> > > > > > Thanks!
> > > > > I test this patch by generating the defconfigs that wants vhost_n=
et or
> > > > > vhost_vsock. All looks fine.
> > > > >=20
> > > > > But having CONFIG_VHOST_DPN=3Dy may end up with the similar situa=
tion that
> > > > > this patch want to address.
> > > > > Maybe we can let CONFIG_VHOST depends on !ARM || AEABI then add a=
nother
> > > > > menuconfig for VHOST_RING and do something similar?
> > > > >=20
> > > > > Thanks
> > > > Sorry I don't understand. After this patch CONFIG_VHOST_DPN is just
> > > > an internal variable for the OABI fix. I kept it separate
> > > > so it's easy to revert for 5.8. Yes we could squash it into
> > > > VHOST directly but I don't see how that changes logic at all.
> > >=20
> > > Sorry for being unclear.
> > >=20
> > > I meant since it was enabled by default, "CONFIG_VHOST_DPN=3Dy" will =
be left
> > > in the defconfigs.
> > But who cares?
>=20
>=20
> FYI, please see https://www.spinics.net/lists/kvm/msg212685.html

The complaint was not about the symbol IIUC.  It was that we caused
everyone to build vhost unless they manually disabled it.

>=20
> > That does not add any code, does it?
>=20
>=20
> It doesn't.
>=20
> Thanks
>=20
>=20
> >=20
> > > This requires the arch maintainers to add
> > > "CONFIG_VHOST_VDPN is not set". (Geert complains about this)
> > >=20
> > > Thanks
> > >=20
> > >=20

