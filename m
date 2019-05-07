Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C79E1664E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 17:11:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44z33g3wf7zDqHZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 01:11:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="FfrRoNiW"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44z31j71sKzDqHP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 01:09:59 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id 66so5825632otq.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 08:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7B0YY/tuwYgSrVIfUPS1cgz9LxSrbQPkHLz8B/p2y2k=;
 b=FfrRoNiW2mqPyRdm+Nc6T26ie1KUmZiB8g8NJpOEz+itth0sQuL/nCF/kQjKsdZkul
 PXSf4dULc+bFlcloKFVfMNq3RbFquJOLQEcSHhKjpodw03sRBfMddCY4qkMAQfR44OdX
 DITETRUBDe82rvbvHBxX/uAdT759KWoE8SBZh5Xq1XsEIRFyhnV/soh4jaPoMqnYHG2D
 3f3YNfo+BwBRIqOCn55ArQt6m/JOGYKZLcKidrS4fzIbucvP+yFSdd2gQC5XIyiQbRox
 PQEMSgyvWjS5m4dT9pbbNU+mf3C8DXxgJPh94oqQQKCSBDudx+SvPKXfsIGSY0BENgk0
 VXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7B0YY/tuwYgSrVIfUPS1cgz9LxSrbQPkHLz8B/p2y2k=;
 b=ag9uHDyhBTTNYNWmRK6NhuAGw7TD8zO7bGULhGRSJn5Eid2cxnVFkIoCgipbg3Fxf9
 yIOLhJjwTIRHgfMHKZYCQ2awwhDC8rOUw18bKhzp7AdBZcNnncn4wfs/kyW8cqag3xWP
 +uQrsIx5Y0Tm9IFRStcySPC16FY/9rLR44vpUHgrCjopUq7zOCQqbd9qbxXPTlZu7sOW
 Lufz/EtyghUgJeBE99WpI2CZFUXa/o9C/whoY8OTSDurbx/V6g5RnFxhT8PcUo19tCQy
 8hO6lHlyWrk8pnPA5fnEisjzYFRbCMZlO5G2VdlRcO3QFyKEusBpEGNfs3aNXMO1uwCZ
 fFCw==
X-Gm-Message-State: APjAAAX6XL8nxsJ3SkbnB0mYrGsQuDiQWD4g0QSnp36+n2/h8EyzhRNr
 xuWPpmL4KysbrFqailuoB5n+wXBeo6ovXdj715gf/Q==
X-Google-Smtp-Source: APXvYqzbDPGe8upi/eqDgtg9Nkitw8XKPSXhVZF9UexfGpCo0Vyt40wC/xRq29IX5XuEtHL2HlKBUOKn8giE61p9obk=
X-Received: by 2002:a9d:6a96:: with SMTP id l22mr13049733otq.98.1557241796269; 
 Tue, 07 May 2019 08:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190401051421.17878-1-aneesh.kumar@linux.ibm.com>
 <87pnoumql8.fsf@linux.ibm.com>
In-Reply-To: <87pnoumql8.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 7 May 2019 08:09:45 -0700
Message-ID: <CAPcyv4go1Ya=D-8O2JjecRA4GRDH1PdhntzjaxhYUQa+-srLiQ@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/dax: Allow to include DEV_DAX_PMEM as builtin
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
Cc: Linux MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 7, 2019 at 4:50 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
>
> Hi Dan,
>
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>
> > This move the dependency to DEV_DAX_PMEM_COMPAT such that only
> > if DEV_DAX_PMEM is built as module we can allow the compat support.
> >
> > This allows to test the new code easily in a emulation setup where we
> > often build things without module support.
> >
> > Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>
> Any update on this. Can we merge this?

Applied for the v5.2 pull request.
