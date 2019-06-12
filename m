Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3359E42E8E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 20:25:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PFfm4RMCzDqr5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 04:25:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.195; helo=mail-qt1-f195.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PFc6390yzDr1x
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 04:23:17 +1000 (AEST)
Received: by mail-qt1-f195.google.com with SMTP id 33so11382431qtr.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 11:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UsV6ibqL/XKDNJ2OpEvvrMOVRlWm1BlR+bmEHcso4k8=;
 b=FLW/CkF0/EI1/o0KeFnLOwAFRSiaS5ITW669kg779HOMWkFNvxnrdnM5Geecx0l5Nz
 mD8pmxViB1+1NY0pLBFDLqTEMXGRc8gAcaGefVR2JOYPlbyETWHXT4uKUCu1iYN+UfTM
 p9w4MPwm8prjpsFLyf55bKeGG5HgyjgXSSmsGtA/98vsVbm6vRv/4GsRJFGNSo+utyOg
 Qb8I+GhfxSRHThYs57bYbj/7AK7VompeVCZdDuBrhDGIMPhrNr8N1/nY+HieevLBxoXL
 /LoPGl2QqlWEk5fMXQm/FumwM6p25EdIkoWsuD3TNo7aCeCFU3IEEVnjZ2mIcQeHJqaP
 y0Gg==
X-Gm-Message-State: APjAAAVFzoRfi+z+4paHANie0Hn4SMJ527bv/RDST2GuHKlw0axAbf9r
 2TJFnA6QW6QXp7eOHUghF+4SU/26YDejoGJzdKU=
X-Google-Smtp-Source: APXvYqwrtZpuijO1P9JI09TD1jGExcV5b13ZXLPm7Kbg/juCT0TY8dmmCJlDtOzXv/omDdVkqjExutRTNjHLEQDNdJA=
X-Received: by 2002:a0c:87bd:: with SMTP id 58mr106809qvj.62.1560363793946;
 Wed, 12 Jun 2019 11:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190612155418.GB22739@kroah.com>
In-Reply-To: <20190612155418.GB22739@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 12 Jun 2019 20:22:56 +0200
Message-ID: <CAK8P3a2GqAZ_Tj6eQ=V-Q8Uso05q7Wh5SVPtC+LYfDKR7pAL-g@mail.gmail.com>
Subject: Re: [PATCH v2] cxl: no need to check return value of debugfs_create
 functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 12, 2019 at 5:54 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
>
> Because there's no need to check, also make the return value of the
> local debugfs_create_io_x64() call void, as no one ever did anything
> with the return value (as they did not need to.)
>
> And make the cxl_debugfs_* calls return void as no one was even checking
> their return value at all.
>
> Cc: Frederic Barrat <fbarrat@linux.ibm.com>
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
