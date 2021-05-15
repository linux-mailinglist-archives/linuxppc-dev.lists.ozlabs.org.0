Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAFF38163C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 07:59:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhvqr1J73z3bsq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 15:59:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.43; helo=mail-ej1-f43.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhvqV1JSGz2xxq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 15:59:32 +1000 (AEST)
Received: by mail-ej1-f43.google.com with SMTP id s22so1436935ejv.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 22:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CxU+SMLsQzcRdf8JW3f+lBwp7dAmZ2RclEuJzkIt4jg=;
 b=gFE9C7xAn9yuGhIsRVotO4IVQW9FWY9KLkT8HXY/n55fr+FmtSBUMJ+Phn+TJPYCZ1
 Qk/AwYzrozhHWL7D6vNWBWJ4gSLzFP22BZl3URKzErU/Z+YOgL8gI66oNAnm9zOslRCq
 1F3turbzNDW32vYCrbN1Oc+Ax3OHSlGEt9a6IJLKz8iVVpVqxzEAwHrGzDrEEigs9Zv5
 I5DuLxgNUkmJNsZMxzj3v4OLCt74gloWiXqUFH00GfEsw86aVhkUXwVcoyyoBYZIYZYj
 idHXyFkLKZrL7mwZjyp0yhwp0Vb12tvjICLuW1HTc8ZxFNlo6yF3bZqe8NzSgSjt4pxb
 bQuA==
X-Gm-Message-State: AOAM533dpZRUZVAx13n7KnhrVlkNGoRlbDBFZrlAHiSIgyLcFfn8kekl
 E/2E7VIO7zGHqshbYjtXlZ8=
X-Google-Smtp-Source: ABdhPJyqXWDNaPpiTdS/BVFGCZr4ufv48fdcgnBwFabbOiHJAvq8/l70JH1/M9vbwnAfYahZo6lewQ==
X-Received: by 2002:a17:906:e08c:: with SMTP id
 gh12mr53261236ejb.115.1621058369429; 
 Fri, 14 May 2021 22:59:29 -0700 (PDT)
Received: from rocinante.localdomain ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id n11sm4926927ejg.43.2021.05.14.22.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 22:59:29 -0700 (PDT)
Date: Sat, 15 May 2021 07:59:28 +0200
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 01/14] PCI: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Message-ID: <20210515055928.GA73551@rocinante.localdomain>
References: <20210515052434.1413236-1-kw@linux.com>
 <985813cafbbe58cd899737ee49b44798210a69f6.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <985813cafbbe58cd899737ee49b44798210a69f6.camel@perches.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Vidya Sagar <vidyas@nvidia.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Paul Mackerras <paulus@samba.org>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Joe,

[...]
> Ideally, the additional newline check below this would use sysfs_emit_at
> 
> drivers/pci/pci.c-      /*
> drivers/pci/pci.c:       * When set by the command line, resource_alignment_param will not
> drivers/pci/pci.c-       * have a trailing line feed, which is ugly. So conditionally add
> drivers/pci/pci.c-       * it here.
> drivers/pci/pci.c-       */
> drivers/pci/pci.c-      if (count >= 2 && buf[count - 2] != '\n' && count < PAGE_SIZE - 1) {
> drivers/pci/pci.c-              buf[count - 1] = '\n';
> drivers/pci/pci.c-              buf[count++] = 0;
> drivers/pci/pci.c-      }
> drivers/pci/pci.c-
> drivers/pci/pci.c-      return count;

I found some inconsistencies with adding newline this way, and decided
to change the code slightly, see:

  https://lore.kernel.org/linux-pci/20210515052434.1413236-12-kw@linux.com/

Krzysztof
