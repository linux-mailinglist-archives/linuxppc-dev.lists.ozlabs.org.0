Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 222E21452D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 11:44:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482hps1MKMzDqT5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 21:44:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.67; helo=mail-wm1-f67.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482hnB2G0PzDqRw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 21:42:35 +1100 (AEDT)
Received: by mail-wm1-f67.google.com with SMTP id t23so2640544wmi.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 02:42:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZWrcztGPEdmdljU6rzvPLWUWlGRg7cvJpWEcVwcN7o8=;
 b=lb6J8J+yawSMjyqN54SiQJDsYV0bPozyzOHETttVTXuCymRsy+IrPtS8KWMDxaZqK0
 i08lUPBOslTGdP/9+/q6abb3Repprs9DONtIKt8AXo2EfEX0w35k9TK1T533uyCC34hV
 q47ff5iBTadTUGvhffv42zGLDkNLYTSjqjjxX0OgCELOjHN76AxFb6xz634f48xGg2vc
 JCg3yKPlw5Bl+EBLX9nl580obwDCwWOOk4DtmRkl+dF67gGtLL2QP2i9pbZzG/aehPmb
 fNjKPNGRtAW98Jjd6Uag5rUhA2lY3vI6e7ovhjqmHsCjrEVpfruWYrrC+GwnP5UyTCpS
 MvdA==
X-Gm-Message-State: APjAAAW6mYtFm9NXrN8TEhqyNibjTCEn1O5u9YQURhaTEYci+1MpPVbl
 prBD8384Sh+L7VnayrMO1/k=
X-Google-Smtp-Source: APXvYqwOXY4WlwXUfJ7If8qgml0d4AG62OZDyxS9ZDP0CGgPABYQ40tZm0CAz1TQujq4tDsEx0hzfw==
X-Received: by 2002:a1c:4b01:: with SMTP id y1mr2205649wma.12.1579689752151;
 Wed, 22 Jan 2020 02:42:32 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id b17sm56037447wrp.49.2020.01.22.02.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 02:42:31 -0800 (PST)
Date: Wed, 22 Jan 2020 11:42:30 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC v1] mm: is_mem_section_removable() overhaul
Message-ID: <20200122104230.GU29276@dhcp22.suse.cz>
References: <20200117145233.GB19428@dhcp22.suse.cz>
 <65606e2e-1cf7-de3b-10b1-33653cb41a52@redhat.com>
 <20200117152947.GK19428@dhcp22.suse.cz>
 <CAPcyv4hHHzdPp4SQ0sePzx7XEvD7U_B+vZDT00O6VbFY8kJqjw@mail.gmail.com>
 <25a94f61-46a1-59a6-6b54-8cc6b35790d2@redhat.com>
 <CAPcyv4jvmYRbX9i+1_LvHoTDGABadHbYH3NVkqczKsQ4fsf74g@mail.gmail.com>
 <20200120074816.GG18451@dhcp22.suse.cz>
 <a5f0bd8d-de5e-9f27-5c94-7746a3d20a95@redhat.com>
 <20200121120714.GJ29276@dhcp22.suse.cz>
 <a29b49b9-28ad-44fa-6c0b-90cd43902f29@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a29b49b9-28ad-44fa-6c0b-90cd43902f29@redhat.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>, lantianyu1986@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 22-01-20 11:39:08, David Hildenbrand wrote:
> >>> Really, the interface is flawed and should have never been merged in the
> >>> first place. We cannot simply remove it altogether I am afraid so let's
> >>> at least remove the bogus code and pretend that the world is a better
> >>> place where everything is removable except the reality sucks...
> >>
> >> As I expressed already, the interface works as designed/documented and
> >> has been used like that for years.
> > 
> > It seems we do differ in the usefulness though. Using a crappy interface
> > for years doesn't make it less crappy. I do realize we cannot remove the
> > interface but we can remove issues with the implementation and I dare to
> > say that most existing users wouldn't really notice.
> 
> Well, at least powerpc-utils (why this interface was introduced) will
> notice a) performance wise and b) because more logging output will be
> generated (obviously non-offlineable blocks will be tried to offline).

I would really appreciate some specific example for a real usecase. I am
not familiar with powerpc-utils worklflows myself.
-- 
Michal Hocko
SUSE Labs
