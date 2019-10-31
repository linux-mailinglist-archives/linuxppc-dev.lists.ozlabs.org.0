Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7D0EB455
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 16:57:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473qhg2YLkzF56y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 02:57:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="bvfA7G23"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473qcK0JcJzF63Y
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 02:53:30 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id 53so5814544otv.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 08:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2RX5Wx5xiTLYEovRDDFwLuk9JtNaRdVkZVutueAa7Zk=;
 b=bvfA7G23dHAFFSvf+zNar2jGgrlvY+QxT0t3ad89+EPZ0zHZehpyTafYW5/3TQP2qz
 ylAbGI8DkwLWrXRPYe5pHVzrfSHNTd3D1WPId48yb9jlWZ4lXVEbkY5Ke0u0yH0HNK0i
 Xm1+WtSzbGt0V0qiFcfMsU+6xOXyRqOusRamz+glDw5ugBfGMm+cfDmBlYV5LqeKUpMv
 SZalR7VCHbbyvHGSVXmfNHt2VEXhUxSAFLQzklbbRXiSZ7iRmY142ZBn46J1SelSqugJ
 aaQf3nenbXjvZ8STcimhNbaIhJhSxkOMvKCU52YLwcxdRqPgFnJMfPmIoxtU7owqZBOT
 9pGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2RX5Wx5xiTLYEovRDDFwLuk9JtNaRdVkZVutueAa7Zk=;
 b=Sio87xOOH/0Z6epyI5eTmGaJXiNt7c8+AM97vfbXdUV4m9Kcn8A3rOGi5OQohcCtfC
 1mzSsllhvc9W6anfw11Wbs2vU7zo5j8UjkfPGSebpZwj2kOKw4mey8eLoShbnbFfWaFe
 AhLn6Z6v9XsqbjJ4LpsXaP/UU8vm9CCRBHUv7WZkQo0ADi0ufI6tB1drI+p16kxcPAJo
 um35aFLzvX26yYPGAi0z0vkJfcWhGdWyYADTTP3J2JGRi7CBpxt7OEJZvWco+vGin4Hq
 cTccwehk4/1ehBQ+F+eBP5LZ2g829ALbP12+ZiMkY/5UnNdrKemqPnzgjnMaGkrV8Xcp
 zQfw==
X-Gm-Message-State: APjAAAXsAZ13D7wf820SjMrhx3D/Ku7KkKwbPy6rIC106XgeXPd/UCkP
 MFZK9MTQZPvq78H6HNKcP3oRStcMbKlXHpaSX4BGEQ==
X-Google-Smtp-Source: APXvYqzGdjUw+psWya1RpMgMepPJxL73tV8uam0VjV5PduuJ7qULjorWMWe4/qApk2lgE5RCcNSLcX6AFBPSOOiTFI8=
X-Received: by 2002:a9d:5f11:: with SMTP id f17mr4971128oti.207.1572537208078; 
 Thu, 31 Oct 2019 08:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191028094825.21448-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4gZ=wKzwscu_nch8VUtNTHusKzjmMhYZWo+Se=BPO9q8g@mail.gmail.com>
 <6f85f4af-788d-aaef-db64-ab8d3faf6b1b@linux.ibm.com>
 <CAPcyv4gMnSe26QfSBABx0zj3XuFqy=K1XaGnmE3h3sP3Y76nRw@mail.gmail.com>
 <4c6e5743-663e-853b-2203-15c809965965@linux.ibm.com>
 <CAPcyv4h42_1deZDaaW1RqX0Ls+maiFO_1e=6xJuHTa3wdWvVvA@mail.gmail.com>
 <8e29b94c-cb82-2632-965c-567d26791f76@linux.ibm.com>
In-Reply-To: <8e29b94c-cb82-2632-965c-567d26791f76@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 31 Oct 2019 08:53:17 -0700
Message-ID: <CAPcyv4hS8sCNvDh2H0_LCR1uOYf8XeDYq6CWkAjPMoDyrp4+FA@mail.gmail.com>
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

On Thu, Oct 31, 2019 at 1:38 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 10/31/19 12:00 PM, Dan Williams wrote:
> > On Wed, Oct 30, 2019 at 10:35 PM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> > [..]
>
> >
> >
> > All that said, the x86 vmemmap_populate() falls back to use small
> > pages in some case to get around this constraint. Can't powerpc do the
> > same? It would seem to be less work than the above proposal.
> >
>
> ppc64 supports two translation mode (radix and hash). We can do the
> above with radix translation. With hash we use just one page size( in
> this specific case 16MB) for direct-map mapping.

Ok, if it's truly a hard constraint then yes, more infrastructure is
needed to expose that constraint to the namespace provisioning flow.
