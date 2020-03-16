Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61588186FD4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 17:17:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h1f34cFszDqL9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 03:16:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.68; helo=mail-wm1-f68.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48h0z34xN0zDqTs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:46:39 +1100 (AEDT)
Received: by mail-wm1-f68.google.com with SMTP id a132so18215421wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 08:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MGxsdsEHOherRp17TfnieaB5yDaVnKlVFdsLG6O6di8=;
 b=MDH1CRKXlSdWqP5wGuOw7caqTM+AU2P3S03/ILFq4Po7+u3oVUaKwfHC5YtJGkHyi8
 MTKcJRuJDYcS61BoJ6nKQnDQcugLNtUq46av2LogwQjykajhwZuFtPcN61Om7pFsHK5M
 i1bgQ6zERl7TGvWKht1tGnHvDpBoPUBK/MHNNTwTxDYM5lPIjFlYgo0KKF5+cg9htRQR
 v0M6OrEdORxPV+UoCYt5b0MlCykwlvOOSx8cbZb9OLU0SMO+FUaY9SDJcSjdvrv9NTCs
 +VzVfQOMTJacQc3MMMvZKiakwR6qunysvpOTzKl1ufVqaq731vP4AtLE8taLR8cIrJkm
 YL6Q==
X-Gm-Message-State: ANhLgQ3ukOySwIGib03+3GydfGpcQdWcOmZKRwkY9duPH2yfOYwq6evD
 7N8d05t65Zv8qc/UyA7tVCA=
X-Google-Smtp-Source: ADFU+vsGSsWLNS4mewW6bBNA5vuq21jmrlZnKO0gV6Uo/M+U90aT4ZqfpnzmH6VqcbrIirthoenViQ==
X-Received: by 2002:a05:600c:218f:: with SMTP id
 e15mr30190351wme.152.1584373596535; 
 Mon, 16 Mar 2020 08:46:36 -0700 (PDT)
Received: from localhost ([37.188.132.163])
 by smtp.gmail.com with ESMTPSA id y189sm138209wmb.26.2020.03.16.08.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:46:35 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:46:34 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 4/5] mm/memory_hotplug: convert memhp_auto_online to
 store an online_type
Message-ID: <20200316154634.GX11482@dhcp22.suse.cz>
References: <20200311123026.16071-1-david@redhat.com>
 <20200311123026.16071-5-david@redhat.com>
 <20200316152459.GV11482@dhcp22.suse.cz>
 <f6088e93-9cb6-08ee-ac89-8cab289dc460@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6088e93-9cb6-08ee-ac89-8cab289dc460@redhat.com>
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 Baoquan He <bhe@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Wei Liu <wei.liu@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 16-03-20 16:34:06, David Hildenbrand wrote:
[...]
> Best I can do here is to also always online all memory.

Yes that sounds like a cleaner solution than having a condition that
doesn't make much sense at first glance.

-- 
Michal Hocko
SUSE Labs
