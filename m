Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9047DFC82A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 14:54:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DNJD52KkzF7jy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 00:54:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2d;
 helo=mail-io1-xd2d.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sw0PAKVJ"; 
 dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DMxF4WGqzF4qw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 00:37:53 +1100 (AEDT)
Received: by mail-io1-xd2d.google.com with SMTP id i11so6744759iol.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 05:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XUdhNg+72/RtwmrV6AWV6mpB24rxemJqtcAcSQr09S0=;
 b=Sw0PAKVJfVVqsnA/UpdGgKs1f/ZTAJ2foJg0EjXiJrWcwKWaRnwVCrvprlbk+lEGXa
 juoaaLwhOLsBumRkuSNSkYK4TEdldnFmsnwkhtcUr2bIKylk/jkaP+LYVseNJVnwiG0j
 aQsu8IeNFzgYu1arIaoRi9zhY9FMPXRgQyaBaKrVtYoq7QDaFWByo9Nsf3KSVljagiMP
 LfFHvcmi5765dheOi6PUwkU7IMNoeaufaQUval04uYXI0A9RlVPtd0drFOFiP1alCSR2
 JlinEy0QQEp08rCWLlKljhP8Vv90+IzF/m1FQZnMtjheLOEnhcvWZpW2CLNWvZU+AQh6
 tjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XUdhNg+72/RtwmrV6AWV6mpB24rxemJqtcAcSQr09S0=;
 b=fnP+tozwXzx9/ciAgsI+Oym3Qlv7ZvdDCjM7EjtzUbVLwOgzjixGYxAP702SKDR5po
 J8WeKWmkd5rvGYh9/72XI0wI4ZXAhaTAV4y5VTGmLmtb6/x8JHLwx8dEoq2mQ4Fpij+F
 C9DgXKbVDqyGIS/4+CR5pq0jDySTOxRNtjjBVRItRKBmEXbLCttAU4bZ6mb+o0mf3e3S
 hOVkXoI3BtKikoh34cinhoD8LOFDCHJasSa7Dwh3JW8bYx3O/Nt2wDB9m/Je11ZK5s+j
 pJTFGpz0AcnAPyeE7yuhlNXdtTtoApiokuJ0x1G7ehhAN850Eaw1H4uPxiqMV7Fee17w
 3nyQ==
X-Gm-Message-State: APjAAAVxi47gOZz4LKSBi+CDS1iTY6tHVbPt7YKqbjx6FbdM/KaClc5+
 YS02QY80XYxkC/vI/F98WcsZVMeWapaGDbx33F0=
X-Google-Smtp-Source: APXvYqyWKXlZxP7+m938s2NtnVh7uWUzz/3JLXFMrU3CoI7uc/fCFHsxayO2EcXrVdJe4vG8AYd6iO08LgT0HlvgUr4=
X-Received: by 2002:a6b:e315:: with SMTP id u21mr9070641ioc.192.1573738669604; 
 Thu, 14 Nov 2019 05:37:49 -0800 (PST)
MIME-Version: 1.0
References: <20191113094035.22394-1-oohall@gmail.com>
 <5a12d199-fa1f-5a60-05d8-df9edffbc227@linux.ibm.com>
In-Reply-To: <5a12d199-fa1f-5a60-05d8-df9edffbc227@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 15 Nov 2019 00:37:38 +1100
Message-ID: <CAOSf1CGVjRC6PfLeoJWQe4WwhcsbrK-=1867BqiGaaRGz_LVzg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/powernv: Disable native PCIe port management
To: Tyrel Datwyler <tyreld@linux.ibm.com>
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 14, 2019 at 7:39 AM Tyrel Datwyler <tyreld@linux.ibm.com> wrote:
>
> Nothing but pedantic spelling and grammar nits of the commit log follow.
>
> -Tyrel

Thanks. My speeling is bad even on a good day and it was not a good day.
