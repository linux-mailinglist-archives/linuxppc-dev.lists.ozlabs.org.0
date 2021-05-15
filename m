Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1E738162F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 07:36:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhvJt65rHz3bvm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 15:36:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhvJW5jxvz2xff
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 15:36:10 +1000 (AEST)
Received: by mail-ej1-f43.google.com with SMTP id l4so1573747ejc.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 22:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SDyLyYKMOMM01yAnQWwaEmsDx06DfWwmC9jVMwC267g=;
 b=nJUHMv1VmNgsNvHC8fGPIEnQa7Uf5oyH9Fm55UxugzNFeGNQkmCaoYokfUXUlUi0yW
 5eibF0MrWYUh23cBKGdMtUnxYLH8rNxIjjLFr+BGH6UUIKUBProlkkTpgsMK6KcF45ke
 Dr5IMH0PAcbGm7II97rGFSh0a0cOoRio1cscjy2mK4uzkf6k+cHjkNv6TGKP5+C4sQtL
 5PA8nylrDb21TaU0+h/sIum/INCyIPALGaK62gTBDLIU5W/2+aDxIzhgFOeggYsBSB09
 ZfehJVY3gwiVTcwx4AUPUhEwQJ8in74lWuXDCyiswfm8fMeJBlNCgJ5YYY6+Ipy2WldV
 IgQg==
X-Gm-Message-State: AOAM532fJwr9F/7s26vNNbZgumivVcWHnoBamD21dTT4D1go7BiiETyF
 Qapof0eRTKgT+ESiYWs+CU8=
X-Google-Smtp-Source: ABdhPJwbr3Y/1auLCBpHvfjMGdiIbyXL5GfmX9Da+zC0OU0n75U9zQufvL5vkiUJg6bJsXEvC0LMeA==
X-Received: by 2002:a17:906:27c3:: with SMTP id
 k3mr51691905ejc.519.1621056967989; 
 Fri, 14 May 2021 22:36:07 -0700 (PDT)
Received: from rocinante.localdomain ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id y10sm4730405ejh.105.2021.05.14.22.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 22:36:07 -0700 (PDT)
Date: Sat, 15 May 2021 07:36:06 +0200
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 01/14] PCI: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Message-ID: <20210515053606.GA72086@rocinante.localdomain>
References: <20210515052434.1413236-1-kw@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210515052434.1413236-1-kw@linux.com>
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
 Oliver O'Halloran <oohall@gmail.com>, Joe Perches <joe@perches.com>,
 Paul Mackerras <paulus@samba.org>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

[...]
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Please disregard this "Reviewed-by" from Logan for this version, as I've
forgotten to remove it before sending v2 after pulling patches using b4.

Apologies.

Krzysztof
