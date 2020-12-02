Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6472CCA7F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 00:27:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmZqz10QvzDrFL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 10:27:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmZp029spzDr9N
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 10:25:24 +1100 (AEDT)
IronPort-SDR: 0J2eRqGfU9sNJbE2tMs6GLiT77xlbyJVBP5NVRkGd80EpMUfHWW1Je08pPGQGA6hY7F9CBQsim
 t2ea7BNCwv7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="172323094"
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; 
 d="gz'50?scan'50,208,50";a="172323094"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 15:25:21 -0800
IronPort-SDR: bsAsT4YKqCQI55BS87UHrThRTl7HByI6HAlaVNTY8yc+fXYMJrruGxj/U7Sq44L4lGp4rKTIc9
 QXAlyR/giNAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; 
 d="gz'50?scan'50,208,50";a="373681850"
Received: from lkp-server01.sh.intel.com (HELO 54133fc185c3) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Dec 2020 15:25:19 -0800
Received: from kbuild by 54133fc185c3 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kkbUs-0000PQ-NE; Wed, 02 Dec 2020 23:25:18 +0000
Date: Thu, 3 Dec 2020 07:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: [powerpc:next-test 121/184] arch/powerpc/kernel/firmware.c:31:9-10:
 WARNING: return of 0/1 in function 'check_kvm_guest' with return type bool
Message-ID: <202012030759.zuEULDQ3-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   fb003959777a635dea8910cf71109b612c7f940c
commit: 77354ecf8473208a5cc5f20a501760f7d6d631cd [121/184] powerpc: Rename is_kvm_guest() to check_kvm_guest()
config: powerpc-randconfig-c003-20201202 (attached as .config)
compiler: powerpc64le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"coccinelle warnings: (new ones prefixed by >>)"
>> arch/powerpc/kernel/firmware.c:31:9-10: WARNING: return of 0/1 in function 'check_kvm_guest' with return type bool

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--jRHKVT23PllUwdXP
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICJsRyF8AAy5jb25maWcAnFxJc+M4sr73r1B0X2YO1SPJe7zwAQJBESWSYAOgFl8YaltV
4xiXXU+2e7r+/csEuAAkKFe8PlRYyMSey5eJZP/2y28T8v728m3/9ni/f3r6Mfl6eD4c92+H
h8mXx6fD/0wiMcmFnrCI69+BOX18fv/7X99f/ns4fr+fXPw+m/4+/XS8n09Wh+Pz4WlCX56/
PH59hxEeX55/+e0XKvKYLytKqzWTiou80myrb3+tR7g8fzp8esIxP329v5/8Y0npPyc3v5/9
Pv3V6cpVBYTbH03Tshvu9mZ6Np02hDRq2+dn51PzXztOSvJlS546wydEVURl1VJo0U3iEHie
8px1JC7/qDZCrrqWRcnTSPOMVZosUlYpIXVH1YlkJIJhYgH/AIvCrnA6v02W5rifJq+Ht/fv
3XnxnOuK5euKSNgVz7i+PZsDe7M2kRUcptFM6cnj6+T55Q1HaI9BUJI2O/31166fS6hIqUWg
s9lKpUiqsWvdmJA1q1ZM5iytlne86PbmUrZ3XbvP3K6g5QzMHLGYlKk2m3fmbpoToXROMnb7
6z+eX54P/3T2pXZqzQsaGHNDNE2qP0pWMncZVAqlqoxlQu4qojWhSaBzqVjKF729EgkDkhL0
AWaF40ybqwSpmLy+//n64/Xt8K27yiXLmeTUCI1KxMYR4x6lStmapWF6xpeSaLxPTwojkRHe
a1M88xtiISmLaink+bKjqoJIxZDJPRx33ogtymWs3MP5bXJ4fpi8fOltuL9qow3r7ox6ZAqy
uIL95lp1RHO2qHWa01W1kIJElCh9svdJtkyoqiwiollzS/rx2+H4GrooM6fIGVyFM1QuquQO
FS4zZ98eEjQWMIeIeEjsbC8epZ7U2da4TNOxLt4MfJlUkilzkjJ8BYPdNKMVkrGs0DBq7i2h
aV+LtMw1kTt/WJ8rsMqmPxXQvTlTWpT/0vvX/0zeYDmTPSzt9W3/9jrZ39+/vD+/PT5/7U55
zSX0LsqKUDOGlcd2ZnMJPjmwisAgVQ7qsfb2GuICyQjueKEi2JugDMwCsAe3rngnFvCjNUwR
V2j0IzN3fTE/cSSto4EVciXSRr3NkUpaTlRARuH4K6B1C4EfFduCKDoyqzwO06fXBB5Ima61
pgRIg6YyYqF2LQkNrElpUPtObxxKzsAYKbaki5S7Sou0mOSi1LeX58NGsI4kvp1d+hSlh4pj
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

--jRHKVT23PllUwdXP--
