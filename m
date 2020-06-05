Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B02F51EFFD4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 20:21:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49drZB5cyVzDq9S
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 04:21:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=KFZS46GF; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49drXM3nZrzDr0x
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 04:19:43 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id l1so8175000ede.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Jun 2020 11:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DqSUfhL+HpfxHMHLxeDxo+cffKJm8uC5qt8/bLSPpbQ=;
 b=KFZS46GFTZ9Gy3Cg/ohafbBdin5UVGOHBKY0W2wI6384HxS9k1vLbbdkOtccGTBnfl
 8XcGqVZeS/TWjJAU9xBTxX6LY+5e3X4A4jUvLcQ2fUqGlmj9zxKy89nhC7UsResG1jCn
 qcYVtf6k/prKJ895tWtyIpNpncfHOSytxbTBzmcHYmUtmZ5VtKm5h7WitDT3/e4vO2wb
 FeAk5ZwfXuLAHuSnbVvQTreK2q8TTD3kW2ol12V7p7CDK6LR5q9MgL+ZZM2BYHDuA3DN
 SGWwD6HEw6x3yX57rz+veZOXIf31k/GhdrbzYfVn74/XVgE4Qnr1acJHTuaoW0SjZHH+
 J/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DqSUfhL+HpfxHMHLxeDxo+cffKJm8uC5qt8/bLSPpbQ=;
 b=lx/Nm4JkH7ug6SQdgD90BQvil6MaNfHUVMLNhLf64dasYaFGNKcMpM/yUBnAKxoVh1
 42JnogY+nIXL7ndY8hT0WKFOgpWrS/4dmLPssRcnQPAcbCrUQihe/4Rue+yg7b8c0o1D
 WuWdaNayHn9JBnZ25WHcLEkPwXGHu3JJujzvV1dAkIvK5NjCT+bqU/ODNTcT1TKiXUi6
 3qmc3C01A9X2ljbdoU0zE5EeVjHtSVvN6Ogj8USxLbCGxD80IOQYJIAHUSNEhxh4fY9Y
 aidld6sLvXT026j8xG/Rpa81F5S1EyXR3uGVbg/Qx1O1jnJ1YbFQHRqtlFzYbqvhmX57
 ja7w==
X-Gm-Message-State: AOAM531xR9bDPCAfPF+9Vv3KE9onKhT81Edkc+v3yEBMcoSsp6Y3FGMd
 hY1ZZdiZqKhMAoJlmD3bx0SMXmiUYWz4fIaScosEMw==
X-Google-Smtp-Source: ABdhPJwYKATWO9a3ADTUxQBAa8Nwr2+GQoHSj84HHGLL7MmG5YsI5pBuAWt+4WD3LOSfh0YCGx6dzCQDPaOgqo80aV8=
X-Received: by 2002:aa7:d6c1:: with SMTP id x1mr6359975edr.154.1591381179201; 
 Fri, 05 Jun 2020 11:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200602101438.73929-1-vaibhav@linux.ibm.com>
 <20200602101438.73929-5-vaibhav@linux.ibm.com>
 <BN6PR11MB413223B333153721405DFD91C6890@BN6PR11MB4132.namprd11.prod.outlook.com>
 <87h7vrgpzx.fsf@linux.ibm.com>
 <BN6PR11MB4132FA66A84CBD798AADCEC1C6860@BN6PR11MB4132.namprd11.prod.outlook.com>
 <873679h72g.fsf@linux.ibm.com>
In-Reply-To: <873679h72g.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 5 Jun 2020 11:19:27 -0700
Message-ID: <CAPcyv4jcWc6HOW5dK1hp0vATDxd_mo+eVK=xkYMPOQ7t1fCv-A@mail.gmail.com>
Subject: Re: [RESEND PATCH v9 4/5] ndctl/papr_scm,uapi: Add support for PAPR
 nvdimm specific methods
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
Cc: Santosh Sivaraj <santosh@fossix.org>, "Weiny, Ira" <ira.weiny@intel.com>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Oliver O'Halloran <oohall@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 5, 2020 at 8:22 AM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
[..]
> > Oh, why not define a maximal health payload with all the attributes
> > you know about today, leave some room for future expansion, and then
> > report a validity flag for each attribute? This is how the "intel"
> > smart-health payload works. If they ever needed to extend the payload
> > they would increase the size and add more validity flags. Old
> > userspace never groks the new fields, new userspace knows to ask for
> > and parse the larger payload.
> >
> > See the flags field in 'struct nd_intel_smart' (in ndctl) and the
> > translation of those flags to ndctl generic attribute flags
> > intel_cmd_smart_get_flags().
> >
> > In general I'd like ndctl to understand the superset of all health
> > attributes across all vendors. For the truly vendor specific ones it
> > would mean that the health flags with a specific "papr_scm" back-end
> > just would never be set on an "intel" device. I.e. look at the "hpe"
> > and "msft" health backends. They only set a subset of the valid flags
> > that could be reported.
>
> Thanks, this sounds good. Infact papr_scm implementation in ndctl does
> advertises support for only a subset of ND_SMART_* flags right now.
>
> Using 'flags' instead of 'version' was indeed discussed during
> v7..v9. However re-looking at the 'msft' and 'hpe' implementations the
> approach of maximal health payload tagged with a flags field looks more
> intuitive and I would prefer implementing this scheme in this patch-set.
>
> The current set health data exchanged with between libndctl and
> papr_scm via 'struct nd_papr_pdsm_health' (e.g various health status
> bits , nvdimm arming status etc) are guaranteed to be always available
> hence associating their availability with a flag wont be much useful as
> the flag will be always set.
>
> However as you suggested, extending the 'struct nd_papr_pdsm_health' in
> future to accommodate new attributes like 'life-remaining' can be done
> via adding them to the end of the struct and setting a flag field to
> indicate its presence.
>
> So I have the following proposal:
> * Add a new '__u32 extension_flags' field at beginning of 'struct
>   nd_papr_pdsm_health'
> * Set the size of the struct to 184-bytes which is the maximum possible
>   size for a pdsm payload.
> * 'papr_scm' kernel driver will currently set 'extension_flag' to 0
>   indicating no extension fields.
>
> * Future patch that adds support for 'life-remaining' add the new-field
>   at the end of known fields in 'struct nd_papr_pdsm_health'.
> * When provided to  papr_scm kernel module, if 'life-remaining' data is
>   available its populated and corresponding flag set in
>   'extension_flags' field indicating its presence.
> * When received by libndctl papr_scm implementation its tests if the
>   extension_flags have associated 'life-remaining' flag set and if yes
>   then return ND_SMART_USED_VALID flag back from
>   ndctl_cmd_smart_get_flags().
>
> Implementing first 3 items above in the current patchset should be
> fairly trivial.
>
> Does that sounds reasonable ?

This sounds good to me.
