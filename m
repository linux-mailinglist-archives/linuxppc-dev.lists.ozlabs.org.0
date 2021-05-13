Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF3237F835
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 14:50:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fgs2L0HH1z3bpL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 22:50:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.45; helo=mail-wr1-f45.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fgs1s3KYjz2xZm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 22:49:52 +1000 (AEST)
Received: by mail-wr1-f45.google.com with SMTP id q5so7322453wrs.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 05:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kD6/mEPYNtoCsTFnZMkPkwGqL4Xhd2RhCwfu9Wi6A4Y=;
 b=a6cBQvAlLLB2F30VL76H1eH+tu7Rf8IfeW+T3Nmq6Ktf9FXrOrAnEv/i76Sy6CxTDt
 NFr0tjWA6HEHspj9T6iCkjD7/ZTrtKMK6kC8NwIg4v2kACCeyBUPe22aTtUF3XtAyn4r
 v+tQmIW+FVsHKlf680ENK7vrxLO1S9TkrC7VX1TfjZ+ZKXoyc2WsNen0VfKN9pSJU88T
 qdO4xLQsr9v5GZGXK9O+GRmH/1ovXNMVADKQuLrQVow4+jp+VeLE+rq8AFfd5Kvt2INh
 e3CaxtsuaMDkcoBEyuzEMpfOzLvZm7prZWFBCOCtrJDeXnDgIdNlZVh+yW0IrK4WdXhu
 jOew==
X-Gm-Message-State: AOAM532YmjBfl38wuNBdQjkMoMHiqv/23A666TxHSO8z0TZUFhlX4bzL
 +wzVxZWtYPigcv4eWfLtUco=
X-Google-Smtp-Source: ABdhPJztl07s7eoyRKlbHMNz4jt/365a5BLrJy6PIq1msAS7SC421+08CLZJr9QQMtzm68syg5Hc9A==
X-Received: by 2002:a5d:53c3:: with SMTP id a3mr48566689wrw.376.1620910188812; 
 Thu, 13 May 2021 05:49:48 -0700 (PDT)
Received: from rocinante.localdomain ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id d9sm959742wrx.11.2021.05.13.05.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 05:49:48 -0700 (PDT)
Date: Thu, 13 May 2021 14:49:46 +0200
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 01/11] PCI: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Message-ID: <20210513124946.GB202784@rocinante.localdomain>
References: <20210510041424.233565-1-kw@linux.com>
 <4557364b-76ce-3555-e97d-14f39eda27b8@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4557364b-76ce-3555-e97d-14f39eda27b8@deltatee.com>
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
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Paul Mackerras <paulus@samba.org>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Logan,

[...]
> Thanks, this is a great cleanup. I've reviewed the entire series.
> 
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Thank you!  Appreciate it!

> I agree that the new lines that are missing should be added.

While working on the simple change to add the missing new lines, I've
found that we have slight inconsistency with handling these in one of
the attributes, as per:

  # uname -r
  5.13.0-rc1-00092-gc06a2ba62fc4
  
  # grep -oE 'pci=resource_alignment.+' /proc/cmdline 
  pci=resource_alignment=20@00:1f.2

  # cat /sys/bus/pci/resource_alignment
  20@00:1f.
  
  # echo 20@00:1f.2 > /sys/bus/pci/resource_alignment
  # cat /sys/bus/pci/resource_alignment
  20@00:1f.2

  # echo -n 20@00:1f.2 > /sys/bus/pci/resource_alignment
  # cat /sys/bus/pci/resource_alignment
  20@00:1f.

I adjusted the code so that we handle the input better in the upcoming
v2 - the change is simple, but since it adds more code, I'll drop your
"Reviewed-by", so that we can make sure that subsequent review will
cover this new change.  Sorry for troubles in advance!

Krzysztof
