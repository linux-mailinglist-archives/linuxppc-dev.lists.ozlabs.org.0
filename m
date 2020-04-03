Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9243E19DC27
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 18:52:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v5Zy1ZQDzDrR9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 03:52:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=JYPaVe/d; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v5XY6zYczDrqc
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 03:50:35 +1100 (AEDT)
Received: by mail-ed1-x543.google.com with SMTP id o1so10061758edv.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6glmCooqmX1TL2gqOpcBPZ8TWDFCGWic5SQqj7XIi90=;
 b=JYPaVe/dmUa35Udq2s4/mDDPbRhi0hGH2xYkSv042JInpO5ZklU+21O+7pHBVKRAiO
 XH11Nws4bcVWw68XB+XwrQBGqRVebOZyZF+h8zmYrANJGLAjBgXYUdziXAZ2mJLVC9Wp
 ZtWdVgaxvEoo8Mh+aO4JaTLySNrpJ4XpBW2BFNCPsPWfx+OJr+0gfj57kcYs4rylEb2N
 p9PrtR9l8n/AsrUwuS4Gbelfy0pdiWUQHcyDr9KfCNoE50Se7SusrLjV3AbiqXYE+GZ+
 QXLr0hixNciYfqCk5aCvpo1vQLpGgAbBTlpCidPlopnBxuHebcRk/fRfPbj44FQV5B5n
 yk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6glmCooqmX1TL2gqOpcBPZ8TWDFCGWic5SQqj7XIi90=;
 b=H3+jNu3k2Z6qReThAbUZ/fW/KAIeT581wb72VAgnMCk2O3Lj/DhPQh7oRWTkTGhcpK
 CZOPhil5GZXhQgTyPL0gVTIMfezOkKZZyr3UnkIKu08b/6eV2FOxJ57feen9cv6++bUT
 ApoFawJ65HG1JItFbaAhwhA+K6KdLxdiVXSTLXY+IYO7fF+KS6OYMHJaDBdlLFmEHZf/
 3qECByU+HP/KY8eQ5DXWoOomdblvVo5c1HPG0ly/lhTZ52VWKRcD2iNuxLJmyw5nWeJP
 tFrXwZVI7tTEBkb4f2i4K+MEPmmY0XBxej+iKSuNdOSOV1J6IrdPlo6KmHK/ivKiuqzs
 245g==
X-Gm-Message-State: AGi0PuZQx+HTWloXKEH5lNIO5W/8F+lMlfllwE9Pf4WaqO4vkKxPMp86
 xUM0nlBaiMLgIKu7eGpxEjixvawJonosJh8GwQk6aQ==
X-Google-Smtp-Source: APiQypKgm80JiuSQ0Y4IHgxQ87n1VvU3bAfZkjSKTAZJqRwKJgOruC1JrK6aBb85XOrH6NVlFiRR4+KIGyuipmoEbXg=
X-Received: by 2002:aa7:c609:: with SMTP id h9mr8398947edq.93.1585932631299;
 Fri, 03 Apr 2020 09:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200331143229.306718-1-vaibhav@linux.ibm.com>
 <20200331143229.306718-3-vaibhav@linux.ibm.com>
In-Reply-To: <20200331143229.306718-3-vaibhav@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 3 Apr 2020 09:50:19 -0700
Message-ID: <CAPcyv4hehbgfFaXgCnNOrNops_fW5fXacmOzhnne6iy6GgcYVQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] ndctl/uapi: Introduce NVDIMM_FAMILY_PAPR_SCM as a
 new NVDIMM DSM family
To: Vaibhav Jain <vaibhav@linux.ibm.com>
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
Cc: Alastair D'Silva <alastair@au1.ibm.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Michael Ellerman <ellerman@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 31, 2020 at 7:33 AM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>
> Add PAPR-scm family of DSM command-set to the white list of NVDIMM
> command sets.
>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog:
>
> v4..v5 : None
>
> v3..v4 : None
>
> v2..v3 : Updated the patch prefix to 'ndctl/uapi' [Aneesh]
>
> v1..v2 : None
> ---
>  include/uapi/linux/ndctl.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/uapi/linux/ndctl.h b/include/uapi/linux/ndctl.h
> index de5d90212409..99fb60600ef8 100644
> --- a/include/uapi/linux/ndctl.h
> +++ b/include/uapi/linux/ndctl.h
> @@ -244,6 +244,7 @@ struct nd_cmd_pkg {
>  #define NVDIMM_FAMILY_HPE2 2
>  #define NVDIMM_FAMILY_MSFT 3
>  #define NVDIMM_FAMILY_HYPERV 4
> +#define NVDIMM_FAMILY_PAPR_SCM 5

Looks good, but please squash it with patch 3.
