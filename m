Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9513EDD01
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 20:22:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpMv91v55z3cSv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 04:21:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpMtf2pfqz2yLh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 04:21:23 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="214063849"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; 
 d="gz'50?scan'50,208,50";a="214063849"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 11:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; 
 d="gz'50?scan'50,208,50";a="530618270"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2021 11:20:12 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mFhDX-000QqL-Vg; Mon, 16 Aug 2021 18:20:11 +0000
Date: Tue, 17 Aug 2021 02:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 2/4] powerpc/64s/perf: add power_pmu_running to query
 whether perf is being used
Message-ID: <202108170232.bpDelLsl-lkp@intel.com>
References: <20210816072953.1165964-3-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <20210816072953.1165964-3-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, kbuild-all@lists.01.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.14-rc6 next-20210816]
[cannot apply to scottwood/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-64s-interrupt-speedups/20210816-153424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-wii_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/98b8a35aa718c93ace9df66df6274fe392633f80
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Nicholas-Piggin/powerpc-64s-interrupt-speedups/20210816-153424
        git checkout 98b8a35aa718c93ace9df66df6274fe392633f80
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/perf/core-book3s.c:2392:6: error: no previous prototype for 'power_pmu_running' [-Werror=missing-prototypes]
    2392 | bool power_pmu_running(void)
         |      ^~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/power_pmu_running +2392 arch/powerpc/perf/core-book3s.c

  2391	
> 2392	bool power_pmu_running(void)
  2393	{
  2394		struct cpu_hw_events *cpuhw;
  2395	
  2396		/* Could this simply test local_paca->pmcregs_in_use? */
  2397	
  2398		if (!ppmu)
  2399			return false;
  2400	
  2401		cpuhw = this_cpu_ptr(&cpu_hw_events);
  2402		return cpuhw->n_events;
  2403	}
  2404	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--a8Wt8u1KmwUX3Y2C
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICKmgGmEAAy5jb25maWcAlFxbc+O2kn7Pr1BNXnKqziSybM+ltvwAgaCIiCQ4BCjb88Ly
2Eqiisf2SnIy8++3G7wBZEPJbtWejNCNe6P76wv94w8/ztjr8fnr3XF3f/f4+H32+/Zpu787
bh9mv+0et/8zi9QsV2YmIml+BuZ09/T67ZeX57+3+5f72eXPZxc/z9/u7xez9Xb/tH2c8een
33a/v8IIu+enH378gas8lqua83ojSi1VXhtxY67etCO8fcTx3v5+fz/7acX5f2ZnZz8vfp6/
cfpJXQPl6nvXtBrGujo7my/m8545Zfmqp/XNTNsx8moYA5o6tsX5+2GENELWZRwNrNBEszqE
ubPcBMZmOqtXyqhhlBGhVpUpKkPSZZ7KXExIuaqLUsUyFXWc18yYcmCR5af6WpXroWVZyTQy
MhO1YUvoolXpzGaSUjDYah4r+B9g0dgVbuvH2cpe/+PssD2+vgz3tyzVWuQ1XJ/OCmfiXJpa
5JualXAiMpPm6nwBo3RLV1mBCzZCm9nuMHt6PuLA/REqztLuDN+8/Xu3ezP0dYk1q4wiBrC7
rDVLQaB6kUnYRtRrUeYirVefpbNal3LzeWj3mfsV9JzEzJGIWZUaewDO3F1zorTJWSau3vz0
9Py0/U/PoK+ZsyB9qzey4JMG/C83qbuYQml5U2efKlEJdz09wzUzPKkn9O4mSqV1nYlMlbco
PIwn7uiVFqlckuOyCl4+MaI9TFbCnJYDV8zStBMjkMjZ4fXL4fvhuP06iNFK5KKU3AqsTtS1
86pHlDoVG5H6Ih6pjMncb4tVyUXUSrTMV85ZFqzUApncnbrzRGJZrWLtb3v79DB7/m20gfEq
7cvaDHsekTkI7xrWnxtNEDOl66qImBHdaZnd1+3+QB1Y8rkuoJeKJHd3AcoAKDJKaVmwZJKS
yFVSl0LbHZT01ier6Z9bEY8ek4Cm+ldpuo3AT28X/bzI1x4Xua52HHI9/qDOkyiFyAoDu83p
Y+gYNiqtcsPKW0KMW55hX10nrqDPpBk1VbtXXlS/mLvDn7MjnNfsDtZ6ON4dD7O7+/vn16fj
7un34RqN5OsaOtSM23EbQe0XupGlGZHrnBm5ofeFsmslcGCnD1VHaDO4gKcPrIZkQuWvDTOa
PkItyTv5F5u3h1TyaqanYm3gNGugTY+9aeznh5+1uIEnQKkg7Y1gxxw14d7sGO3jI0hDE/LB
SaQp2q1M5T4lF6BmtFjxZSq1sWtsz8LfY6+c1s0/HHW17veqvNcs1wkor9Fz7M0gmjl4PImM
zdXZxXBeMjdrsH2xGPOcN0ev7//YPrw+bvez37Z3x9f99mCb20UTVMdur0pVFbREoFkD1QpC
RZJ5Ivi6ULA4VDNGlbQIa+CLrFm3U9E8tzrWoKRBNDgoy4g4nVKk7NZBPeka+DfWKpcOhrO/
WQajaVWBvXAsdhmNQAI0LKFh4bWknzPmNbjwwdLV6PeF9/uzNpF740ulUMPgvyljzWsFqiaT
nwXaN7QA8J+M5Vy4g4zZNPwjZKgBJkUI+biKRA2mh9UC4RoqGSvoA+w6xUjJZ1SrskhYDgCk
dJ5Mj2C83/CWubBaFJ4r4w7KbR758DsDGCUBljgoV6+EyeDZ1hO720jKpDmGZYGJdJSMBVGN
6XNVDz6l8e86z6SLpz2FLdIYTqikjnvJAHTElbeOCnye0c+6cEYXhfK2I1c5S10nxC7ZbbDg
wm3QCYA7x8GRjkBKVVelh41YtJGwzPbEnLOAQZasLKV77mtkuc20h43btnpk0Mdkexr4StGY
jRBnabFyTL1riyvR6xnWU+NKl4yvndVSbPo25/ZuvOXyrKDUhxYeOLSA0LaSCgkmEVFEKiL7
yPCd1j3sG2woP5tfuH2sHm795WK7/+15//Xu6X47E39tn8CGMtDQHK0ooLDBZI4Hb/X4vxzG
wRpZM0oDcGijg34bM+D0Oa9Cp2zp7kqnFe0w6FQtKWMN/eGeypXovCR/NKDGYMHRuNYlvFuV
BUZ3GRNWRmDZI5o1qeIYvM+CwZwgPOBQgj2ilnarjcgabQcep4wln+jFxvceIa0eeYAqszbP
uxrfle7vseDnC2/kgr+bikexf77fHg7Pe4C+Ly/P+6MjCeAgggFZn+t6MlL94fLbNxrJITFA
u5gH2i++Edt15n83P3f0ptvu2L/e8Sk8aCfO53O+wFb6sSH5PEheXYxJk1X4K4sBXpdiNW11
18RS1FM8MGwTP6hE4Y8xbWkZ2YSRFeP7wrZG75yatMgAmlZF0URxhgGwGW1foK/VGdyUnjrS
pCrMSzxPfXXWN1iEkojS6goGeM2V7al4dv02kVbnDnpCt2aJ95lHkjkA4XyxlK69z6qRXs8y
OJkyBzgmDWh4dnN19v4Ug8RwIM3Q6bN/Gsjj88aD4wGvS19dni16rWHAGNmn71yNqxGwR5yy
lZ7SMT4AwHZK6N5Kci3AUzee/DjWn5Xp7RS3sLwNTagK3IAPfVSyAdsqkwY0J8D32uoq18Tb
EI49jOlSGugzbezNejfcxDDLpSgb4IjIS8uli8UsS7t/jIeUaincx7lqApc2DKSvFq1WfLw7
op1zlKLjUqiMDuk4L4InJe1sIDErONxvWH0ifXFCvRYZ42Hde6rnh/NTxHffKDXcoRGgegBe
5tafH8H14ZgMRszwvkgy7PH9xcWHpOCL4IISQKu3dO9NJi7P5nNiuSsQPF4txcS5rvRyBT4j
YNRo6YHsrgcx2LWUntrO5IqFokBrQDyrahSBHsxMwQrwsFjJMAgT3LKKG58N3UgA69Kfq4sH
zeL99n9ft0/332eH+7vHJgQ0+GugCQG5jLDlEFAhencDy4fH7exhv/tru4emfjpsHs8wDQo6
MzQdnBZ3YDcmFDC6Iq9Lw8nhJ0/TRbnPL5gOOrhrxUgkwHY6Svm5poUICIvLuXv10HLus45G
oYe5gmGG8P+N8OIxvGQ6qaOKNJRWb4FaN7B4MGrMU2oyTcWKpZ1GrDcsrcSQHkJJulhbQDrC
IRajtvGb3sK0aZo+rNN5KYhTx7w2Do7Grf4MD0EBLC4d88WzyCaVhriHuAFRhosGPA6o9c0b
92J6tU0/h4y8/9FNN+Hg1wN19bFO63RJi5HbxfZhD3+hV/MwzkiBC4sBkcjGQFTuQZxUXePt
YEAEny3loTosV/NvIEL2/5xd4oWoONbChIZwWGCI+8kQbf4IlHEZHMPlcQfppkhuNTgjA8N8
MouxEZETO+0ZoPuXoXt73qPj9WPSFUvl54kkeHnCu/39H7vj9h5DiG8fti8wLHifzq17b6r1
y92HN/XVGyhAyt6v8CZr8AAFtdEJhmhSFDG4cxJBbJXDdlY5xh05xsRHWKTSwiYUjczrpZ+n
swNJWCcCRZjFjEhrcuZ1KQxJAImlOzStmGWNR+ExS4+rnFs0JcpSASDNfxW89VNdNi9wNaTp
7IgJeEZTNAcugbUbrcYhAiygXoyMb7v46ZQB30mTXhwRLc7HZ1KPTw2T3ZmK2hzv+DDQV6sZ
gHKLs9srq1kx3lsbw3Gbkut6CftowtAjmnWJfD9waMegVDsfan/qFAcJPE11g16DiwOYxoBL
1SblMYxBkjHf8A8sjcHAV+0f9zUDSUdXxR45A/nYMAOGIZvcWSMpTQaBZ8UNT1bjseAMcR8C
g3iMf6pkSU9nDRgmW7tkPnE0WnB0r06Q6hgen/VKBrDaUEIBN3tV+B7hHSg3Uvyv2uFnqdyo
aGqUTSaO1khk58aqYZqQG3GAnLd7LQTHAJNzqSqqUnj1qH8wroyCQ4wvbvAZ5U2CHPcx4tEq
NkgDFnWdj1n6d2pnsOE1T3aGy/C86lMuuQMv2gebyqbWpHeMqfHzDUBoUIHO2DyFQ68xtnvN
ysghKKzukCtdwanl0aSdjbRf6743Ggfvg5p/g3sYnQ7VZpkbbAH2t7XT5fUNcaYgR5Ibn8fx
t0bEU+FutPc1SGFk001uLczajdpS8Z7hOYZSMr7H3cS6UY3Y0OhVV//D1ebtl7sDIII/G0T3
sn/+bTf2ZZCt3dOp/Vi2rmypyc0M4dETM3nXhgVfRVqtpA/ynGYSSf5LhNJNBW88w8SMa5Vt
9kJnuPD56Lm6K2maWgieKkYlCFqeKkd6sHNDpl3rwVKG6DiOLnlfNBWoteg4ydxjS8SnVKLB
bfXhuHNPx+TpqVl6xhu6IGXMhpnSU4worNd1JrVuiiTaZHQtMyvW9I4srgJZN8nVm18OX3ZP
v3x9fgBp+7J1/B54pxlcAKjhqF5j8ip4OrqpNUgBS1WOQVviM3V/AuzmWoJi/IThB5+Caeql
9uIdTnOoGGtIcBuxKqWhozAdF3qC9GEiR+sTNpabDgYh2/WSKr1opkANEuvxHrR1ylig0AcY
mgpHcJ55eVuQ3kVxtz/u8H3OzPeXrec8wnKNtCi48wCpe9KR0gOrEzmNpdc8hC9GMzZVbGqo
k3B8mewTOANNUBVz5X65pkNc3y59ONMRljEdBPLn67Wpzs+ccFneHp8uwFFBhTGxWr2OZwbM
PK/L7JqwWjkiBdAVKSsKfEssiuwLtO+pMwfi2/b+9Xj35XFry4FnNsl4dM5iKfM4MwgrnENO
Y9/Ra5k0L6VbatU2w2PmV18HI16KFnz35xJahV1itv36vP8+y+6e7n7ffiWdzzZcM3anmDb1
yn3B9mzWQhQ2oUycbBPv6eooE2XQAP0TD7iNyvUDdJECPimMteo26XIxbB4QDJ/kHhHrlwLv
lE5AZnJVMl/QLWgFJLGs/Ly9zoj+XdmqxXeZzK0sXF3MP77rOGz1UyFskqheZ160DPyD3CaI
yAcfA8Y26E7T5UIZI9s/F6NgxkCx9lhRObrOnW3SI62/7r2/qEsHIzxdh+rmYJ+4zXBVHAhN
qKZ5gHJGNGCfeagnLK3DUffllPn2+Pfz/k9ARFOZBjlZCz8baFvqSDJKRkBv3Hha5Abeo3eR
tm3cezCPKX0WN3GZWceZrhYTCH2pwkuZ+6uXRVPzw1kgUg8MfcyvVNUogTEwFblboG5/11HC
i9Fk2Iwhfcq5bMklK71euBlZBPBOQ1yVWN6QVTckj77N4YmrtQyEt5oxNkYGqbGiI/N4mjVL
wjSASWEiOPAjL9unh4WCF1jGtjpli3seXi1dv7dTOh396s3965fd/Rt/9Cy6HAFV5xI37wI5
LOgZOkL8TgLjChkr1yd5wBezTiSogawIqQpgbqIWNNgpThBByCIeWCfQNDc0DTxk+i7gFkkC
2D6yPV0EZliWMloFKstRGjStszcpuJwf5oszunoqEhx60ytJA9lGZlhK39LN4pIeihU0dC4S
FZpeCiFw3ZcXwT1b3EZvi1PVTlGusf5V4RcsgG2Go4XLYBa6koOpQuQbfS0Np5/yRuOHBQGr
BOvE5G/4tWZFQIfjDnNNT5nosGZvVgquRpAjPa8zUOgAHEJcn0oTniDnfv25QypvENvc1n7p
5PJTOjKes+P2cBxFL7B/sTaAF8JCXipQPiqXo5Kx3pBPhh8RXKPtnCbLShZJRc7LGVVhu3QR
Mxbliaj0WsoYU+qeF9Y11sZQtheHyd2ipbahzjgRhO2IGDhV9VSjDWyJjIpRz4Ryo6E9FSPG
VAT0GtAyHeNXgyEyUwC0bkg31XQVIaPZNPgoYwTn0mPBTGVt+agyq8lrPr5uj8/Pxz9mD9u/
dvddBt3zU3HvXC6NDt12w1CxQNVBQ97A/wdPpdwEfGygmfV04i7FGlq9o3djeF9lyJ7EWE9L
nPa1xGSBm1jj8QoV65mHolLbZAF0piLaznQdUW2IVKHngcFMMMOBzw46fi4wUdUWcNYqr8j6
1o4bQzOwaFtxjbBSrKLldPU2NN8FcJEFIS2xyx7SFJ64OeRJcdJk+WXEqEq/nuGaFvSM8e6g
Ry3WGSk5QSg5+noa/NOUpvZu4b/hunrzdfd0OO63j/UfRwfE9ayApGgL03MEVUDPcaq8y51I
dz5eCLf5I0KXnKol7bkAA+I5JrbAosmlO4AsXstAqBUtyceA58tkTBNEkdShAGAeByrMNIDU
0NeAiPBjmpZemyofBfEH153JFCNExMkIkxjw0DvM0dncqFEo0VQdFpyzMppoUhuk3923PWZq
WixSNXmPRKRFAEiDijBZEZAKuLk8YumoOKxbVNkMHssyA/XS5P+jbjPxbv/177v9dvb4fPdg
C6+6c7m2UX63gLIpp+nG8eppeu4mvXxiIwNnFw4n9fd4XX3owYbGMfDrxdD6U0JBj0q5CR6j
ZRCbMuCdNgyottth6iayRXsjyMbsxxgtsw3Cn4ja2AxrZZTl8xJFtIz0FUaNFfOEJkskokPa
/DldnFen4BnwCdjr1piP76KbyFAub2Qcfati9xpUjHEWE4geARVjlcbL+kNjE9EiSWu1/NVr
aOO4XlvzEfTwu4m9DL+hgyg3YAGbKKm72iZETKHIJiWMZcptCYWtApjUqDdNwRzChkqB5FWa
4o9wL8y+eLmXodVGMJvPdz9Mh7Y5B4V8J3MnUbkMp07sEpfUzXfUkmXTxWHiu1nXgiJZu2KD
roNUghuSoavCow29HKwFxCtCjXxyvaP9NC7SJhMzPS2lxvY6YGksbRJf6Xwfd8AmOr873FMv
lEWXi8ubOioUDX9BfWW3KLe0x871x/OFvpifkWSR81RpxO8o1jL0rSorIv0RDDwLuMVSp4uP
8/n5CeKCLj3VIteq1LUBpsvL0zzL5Oz9+9MsdqEf53RQMcn4u/NLOn4S6bN3H2iSBpGjIyv4
mROgnCgWtATwxfhBN6kiAZo7oyrzGwqI6oIOsLR0LJ3ldEaz5QD09e7Dezrw07J8POc3dFSw
ZZCRqT98TAqh6eNs2YQ4m88vSCEfbbT5Cw7bb3eHmUQA/PrVfn53+ANM9MPsuL97OiDf7HH3
BK4WPIfdC/7TPSAj67Er2v0thv//uFPxSaU+r+Ui4M2hO88QJxU0ChQ8oR3YYlPgFyfkur1n
33yOjqGc1uGcfNJm8+TgDLq2oGQysn/nhnKYsIOTUcPukfuJtm3B7+yb/PSwgnbq2fH7y3b2
Exzbn/+dHe9etv+d8egtXOt/nNRmqzm1tyyelE1rwG3vOtFAou9NuyU9ORD/s9uCfyOqDUQB
LUuqVquQ62MZNMcoJMKzyTu2x2Q68fKUdtO1kNNr8Vli/k8c0v7vPzBp/ItI/8wCvhL85wRP
WVDDdH8IYbTdH/xzvO7+Do2j+JESyjA0VPutyOTLPH9ZVawTHvhy1crzOPQ0Iifh7YyemYcW
aBhLr6P5PGDypbvrRcvcKPxYwmJ86qUC1ASJRhs8vM68HdSDfiqPQiJrwQBJwZDTqhp5loPq
+mQr2E/kJo0IWEHYGuYz6DsugqTNTYiCbk7AV1qCy1hFtDytAjkaWJ8O2GfYF6oIFQgHgMMf
aq839mbs34oK9N6EcGaeZoEPRgQWLIdyL0VyG4p1ZJFUdSM7EyVVcE3FXrtininVmbEI/LmR
1M/s2gGT58Px7WH3sJ1VetkbD+Tabh/wb+Q97y2lywawh7uX45b4aPs6dT9+xV9wlHmkSkDC
mRHrAM14f6YLfp5QC0D9SCfLgPJuTVt3IJ3N6V7XPD9/d0PVq/pLzNzIoEtalopFXLme0MW5
96PW2vujAtgEfrsAVMwz1pT/60ApnMdKuWI9QzOJO2vk/nkMbCkmDcltvZo25ePVYmNK1RAg
8f8Yu5LmtnGm/Vdcc/hq5pA32kUd5kCRlISYm0lKonJheRwnUY1juWS7avLvv26AC0h2gz5k
EfohCGJt9CrHqvOEgctdJ06Qcj6kSNx0iESfO3AARfRwoNEgM1LKf1e0zjmMYcdY7cTzWenG
OdCawE7g9GxV66N7Wcac1xWxyHYiRGkavTEcxUZ4QxMz8Fxhq5WliWuWi8WUOqZaTwrYAp1d
OxrgUfgOuhMWXb0KUUFil0LRhpnNJjnpith6zENmvPPc0bKGHktbzrDws1iNh3onbasXjuPJ
YPOy1muO/ngyp6/fSMrp2xWQLJbERNTR2/D15NopPYfhrIdZHIYty/lGC3JMBT2bpKUczii6
VXbfOvV4vj4+Pb6+3gBRZ4+Px+7ZX55HrQdaBzUcb1y7pLkPIYHXWE2X0V8fgl6bxfPL+xt7
/xJhKxqp/CnVMd2yzQZFhFLJp1k1KJoKuHgbMJuGAgV2loi8C5JN3L8+Xp8wlNwZY9Z8v+9I
jMrnIzTQbtsStABfopMSKrZKvUNH0lgVU+pd1Vc9XUbryVvvtI7spHU1rMrgSI/n8/a65UCr
AVB2y8gha8hdNh4xIqYWhpExaZjJeDGAcUsDk2Rh0VKYGunf3pIC0hqwVUdu/0kkSKsOxuCm
BmaOvZiNaWGPDrJm44GhUJNy4IMCazqhRYEtzHQAE9j5cjofGPbAoc/HBhAn4wm9+9aY0Dtm
DEteY9DgCLfdgdelWXS0jzbNtjSofTg4WyNY+bQUsBmyYFJk0d7ZdQxH+8h8eHU4djwek0ys
tp+0HVxQ2x+ntNRUUVMvEYx/gwLYcex78hsMIOBb56sl3RkK4ZzsmLmwR8pdEI4/TrCnIIc0
z3PbVAmuN9O3nkI7zoSTDryowe1TyiKu3p1TDIaq93hVBuy+7Uf03abBTOkBbwAufZDXACda
J3R/1JDtZkJfiRpEwpgBtxAFY1TbgPYYMSJgdCA1TLLnNhPAtUalwvWOInQZdqHGZYFLD2Tz
PumNZsYcMd4eoy6tQYG9BfafkYg0DUePkyih73lt1Jpzamtg6CMx2AVH4cIPM+jrzgt3+4Gp
Yqfz0ZjeiGsMsiT7oamQx4zjX42I82Rg3O6OQgxANqmwF3RPqxUq/c4ZO1kFwG0tdRLPo25/
5a6KLj09bst2l+MZfcyWAJQl4JbNb50KuA7sMcPzlIzdNB/B7T/jDsCymQEwB8Z6JDOy9jzO
ZENDuR7GTB2EHQS3/VR9IKRdRebRJ1DNfsJ6CEukCZhnX2hmQ9Hj6OglwP+Y6jh58j5rQDjB
eLRiZ8O+ul503+1srDlzAGo9lkQYuxuVugP969rLiTUqduocMvWxm/tT40wUd+lksTKNEyAW
k4UJ4QT2dMTEJiobnBwmi1H+gRZL5GL+YeTSiEwCMetJ9ZW88/76TdoWic/RTaX/KZ9CrkcT
LRHmHxWikaliQSGs0YxRQks6/N3VKHcQvlhzHJkCJPbRQC1V2nmcsoydApbKUDMIqOipZKom
cYZeFA98kLoFMZC9xJAkDJrW78xSDkGNbu17SgkI1P375/31/gGl2o0dR/m2LNPCvRz0fCZK
AYE2mGHq21k7wMshqwCaS+axXwa4phjdRdsZHtBhbWUVcaYb4yr5KltYGuAsapdL34WzShqe
lZ75Sgn6eD3fP1F23Yr3L6xJ+9xQ9jSX50+S8Koel8oCKlShqgNtv33BbL0lJhUbLg1AhXCc
MGdUGhVivBDpkpG7laBy6n/J7C1rk96GDsHKVQeLbrBChrEpyTJeWDxUiUSJcON7+RAUfnk5
hspwxVY4MPC0i0dnEvSqCZUi3uXUjxjYTcUX3B2K9SnznB3DCofFNmWkgGgJlzGO/ruDI6Mm
mr5VRhTomkI2y7eMIkqSUTIKu5BjUCaKOBCFCrNOn8ywfvvRnEsaNK3llS1Dw+jHR+bAn268
uZIGs8s/cTae/S1LO/xkc2Bn2qcyLFumbG77UkC47vYFpRPNshN+FFLKgImU2sUqFE2nTEar
bkshobjjLKpRlKmw3JvaNdn+Nlo3WVewpfXWjuatTbObL5HZKW7+QeNXNZ9v/vx1eX17+n3z
+Oufx2+ozPxcoj7BNvbw8/zyV0v8il8A/c3LCxDheuhKIW2pY9j2MW0B83Fd+V9VVlSJlb7w
5riy2xjvFKRFvEgLybFjk61rgVIRZIyCHclqc+tNGu8/mHTPsGkA5nMa4GDclyph4izBijI7
SguPkNhHbz/hqaYebeh0XTc7+J3PyZhw7ZLo21yqGTmmaPfNGoE0EJyWAxBuweqLTXtuypwL
MS3jSWE3onehbhqbeodOe/0eZ/HNw9Pl4V/q5AZiMZ5blkrx1B/+ZxmkojRqQF0G6038doHH
Hm9gkGGGfJOhR2DayBe//q9lzNBrj9YcETpZQoVgwqUEbWj2jbJARr3ASDhlujYtoHW0qRZl
5xGR3HW1oWo0u1uB9pyyfmrXVTgtzUxdVBzGndImXY8e4uPX/csLbFPyrcRqkk8uZ3kO93qO
O45rJp+nO3AchIz4S930j5yTsdrAMvxnNKZvfvr3mXchhUxMnbzzjy0NlCwM1tYCuD2+TgNP
Ken9va3TgYFbbLrymXZ8C2qo6rNIlj7+9wLrgxpCk/asBISMsZTssSN0K82Qqe5BBQxzLW8A
E8P3w/mxmk+HAIy+rQSg5MNQQxYLZ2J1p5C2WXb6UC2TjUv1bTUyfaokH87Xt3fYeozLyt5u
E7hDsf4xst9gR+ymcirfTb6jefw4Jia4lExJzxQ9DH5T2OMgujSZgIq7CehgP3MmK8aCXsd9
tD5Mq8MFT+7BVFG0oZ0B0aEiALw0KGW9ZVWt6DbKxGXfHTnjPLTNCxhdlkwp6UZUNJk0XRMx
/VuGVgiRMZT0IwUL0YAGjYvoCmpyS44E5aUbGbMdSnsxrcL60a51mFop709v5+/vzw8y4hfv
xA1rBmOoWqvZnFGhISCdLhkVQEWeMJMLo3PJ7Y7xI5HP29nEWo4MVrgIkpJzvPs6TOKcBrXz
HUYBhBiplRwxsgIJcGFvGwdHOpyDfE0eT0Y5ry/coBbc5c5g2SmuvRoxOyw+juT5xPgGCaGN
FCrygtHxVmRak1+SOf0DkmGj9JDrg8tSaugDZzzN84F+iieLCS2/R/JOLGaTsewyet1n6JOX
Cof+FCTD27njEt8gxdz8QNx6gelpy4oDizlrGzo/SpK+YByf1DzKx7P5cmkCLJcLw/JSAMNg
KoDFhBqqASt+tkiANTMCrNXI+BHWigl4U9NXA8+vaI5K0rPFlDH9qcim2r1wMxmvA34Wh1nO
XKWRmngZHdQKicApzWEl8n2XZDNryu++STYfmZ525tncMtBvrRHfb0k4zxaMcRHS0zK8PQ8Q
s+UiH8AEc8bNUVJvTxasAH4nS7MgNlTOsypIzgQw+9PpPC+yFK5F/Bj68XRlmOB+bC0Zjr58
jR8Y5oDtB4zBcBani/FoTm8QSJxz9zBFZHhw2SgJMKx7BVjx60YCJmN+5eB3Q88YDroSMV/w
i798i6F3EWAtBr50xfSTBjAfuACCrZ5ZitnRn42mBiYGAIvRbIDLQcPi5dSM8YPp3LDgM2c6
t1aGvrgLcsOYAz+7C+2tzSRPQuYnEV+j0DZ21TGwZoZTEcjTsZkvQMh8NARZrRjrMty7ol0A
vNyStcfWQcBsGXbBuqZhELCOebCn7zpqt0JexrDdZcGGby7cV6Q+3dQtd5gmTHIlncZW12TT
1aCpCt3OfPY+nJj2ffRLKBw4Gso4PwYUgVBhU673Lz/PD6+UiNJN+rJkG8p0J/wq+YtWrEKe
XO9/Pd788/79++O1NIDWw+iu60RCv7WyMMLUIHqRfv+qY6vAB9GMIlSxgc4S27BMEsih8P5b
KkXo0wAwmfC9tS+ybqTc/uf9rITmxL0PKoroSQqUw9ZmrI7xMaNBLQDSsSvZfo4u1kGxzbPZ
nNkgsAEqNQ/bTR7mtYgCJh7vWgoIOQcNbKFgQwkhNYX2d3nVKjINNX1UnJb7h3+fzj9+vt38
3w1cP/uOCPUrgFo4vp2mhOtfc6m3nVtfmp7w0Crci/nN6tWX59fLk/Sif3m6/13OCKp1MPaU
PrRaejJohdM1Y2gVw7/+PgjTv5v8jG16Eh3TvyfzejVhxsb1frORYYGqmpsR6ZOhNzDBCWp2
AzuhBULUY2hnxWb9ot8DvxIPDk371uu7qVS6WHPnaiMfddVHVQCg7m5Xi4uivZ4WRP4s0Hm1
HX68XY5Rn2DWCE3xnLZqCV2Vb7tdFDvtB4C5vyvnXbsc3uMFe79dGIgcOi7Sw/KUlbKFWs6L
DrFqXSMeA4J7Cm2UnAQijOiQCdhmdZ7IBCqtVEqy6jpcQqtiGNd1hCbxQOb82Vsw1p5ANpNJ
dVv26B41L71vk13d9QGnHux3Jj4aCFeo9CltWum03utJ1tscqTYbOkj2Apx2grFAl/Mgi21a
cKYaq+yCxgs2aAzWEe87gW+U6Z77yX7/dr7oB3xdpn/2zrVxDcgo6iroUGMNJedB7PQGIOrH
idjBcd6zj4DClg+pcDHkbeYlJ0yE44VbxnscgJwJ334nyIzrUHVHTZi+PD6gwQ4+QBzq+IQ9
QyscrgmF7SSkNYakoU+H7vUmC/fYkWx9a8+/FfSGimRnB/snI7GXZAG/DPRoz91EkBzYjs0l
akU6LGhXoCEx/wLJhfLkExGkTqPDkG6jMBEpfYgjxAvSglF9SLLvcfJsSf7KuQip2RGsBWOa
JekbRvEqiX6UiIixm0LAQRxsn1npSIeW8VbsEnDiu+Vo+xmzy6h3e8c06sXe0Zt/SvizHAEC
tdw8lTFKRNoXmzNgR2p2FCFn5aa6JcTMPZxdPkJ8R+qzeDrjGKhoYXSgdf+SHG2FcQMI7K1w
pEOTAeIjf22gnzbAlPLvwADOuDD4GtD/HPO58YgIPYIMc1+mUjDPv5BJM4A04BE8+gyXG4cd
otoQVgg/ELGX2f6JsSKQADS8ZOLfSLoPb0lwkvNrEDAnU65rtcsBF8w3I7WF6VNTO0j3TFQa
SfcC8/Ox57ms84REsCFoSqrnI1vAXCglZh8Cq8jTE84oCvcJdOOxU8Mmn8IdIvsSnYyvyIRh
0cFOlnqGNYuxHrZ8F+yRMyjilFFh4W4pBOsFg/RchAHfvK9eEhk/DmMOOKYVr+KsFTvGwk7y
CX5MG75RPEtj1NliseoKpW0orlL64GzIxTaCIz4nX9yrv+YZtcLa0j5dF9HOEQVKVnyvlNNo
lviot+9HrcZiH++HCZPCAwF7PyaCtWoA+G/Iqf2RXqfc2Tlu5+09phXLpFV+wx/W5fHP36/n
BxgL//43ba8ZRrF8Y+54gubikarcvDhLR8ObOtXY7pZxxMtOMaNPwwcTvJv3k0iUiCDQLJjj
I6bPBS6MKFRioKYYMN0Ud3VReevU462iGQdv+I9PdmPgKsuMwPmcup9lkBUMvoTig7fr5ekJ
JUqEgUbgsFdKpKUuzNp2g2VRgTZNMqVwlKQUfS225Swv84mi/X6BeaxiXTLQPBD72aZlvN6Q
MCivPAjYrqhxHv7P9C0I6lr9NUST6WKD2uC/U0b/UKMC4a89e8+P3x5wYgGzja/JuePyFyB1
l9LRXZs25MDOMdrJpkO4gCMBXC7Q55XoztA7dsKb4C8lTGwFK6pLC56n00Aqg1XfoURHrhMU
XIaYag+dm4BZ3nr90LzI5BI7kKzBDqejyZzxTlSI42Q0pg9M1QYnWEwZbU0DmBsAUs1GD3xD
p7XSFX3BOAXW9BVjeCIByghzQgyuJHeNA1WlqKWmVWI1nVGll/T5PM+J0FddmGUx5hRN0xmd
dQ1YMFphNTzuxBqZGppN54xBiqRj6JQ5Y3CiAL4zX40ZHUE9wPP/eLpIp+ONPx0zulYd09FF
dOa/jLH3z9P5+d8/x3/J4zPZrm/KS+A7GrJSTNTNnw1r+VdvBa2RJWeyYiE98PPEo1kWSe/m
u1Papaf715/S6D+7XB9+dpZw/VXZ9fzjRyuikOpx2Ba2HWmkTlBSX8OIlbAIdpZdO6AEBdt5
cDTD/p6x76t1LMPvdGLaeKMFkrnouZS1LSTrYdRCVdlJiPSx5xeZLPT15k31dTNTwse37+cn
dMd5uDx/P/+4+ROH5O3++uPxrT9N6q5HL1bhhR/pCjvoGDZSqBgDJ7M9r+KCDb8rlpJVw0ZU
d/2eS0LU/kxmcBSjJNbC54YPg/WFYm2HlKTWg+tTlYo2dZK9ZiMsSc3FoSxNMqdo+a5gQXU2
a0U7J4vSE11YqWb+uL49jP7QAUDM4C7Tfqos7DxVfx9CODYTaWHpyChnEBS0Q5hpQBFmm65r
TF2OGhaiuOMzqJcXewGXMeA6yFGRrU4ONKON9z9sKcFkVM/Z6/X8q8dcvBuQF32lLVQbSG4x
NpwVxE37SmUCwgSL0CCLJX0sVpDdKbDmjGVvhcEw8ytG/V5hknTuTAfeJVJ/PGHMB9sYxj68
A6KNDipQDhDaSqxCSK8TJoZZC8OZPrdA04+APoJhzC/r0ZiNM8s8GOu7KROwqUKkwI2uRjTH
XGE2wXTMsLT1qMNEZuzkNMjcog2Y9FoYa94K4gXA4pvXQ3IAiHlyIYRhwhuIZTEZLuq+c2Fp
Wr0NBJ0w2xuIvkGhlzIqDqWSucYjc/SBjcdNp5OBdsPMmYw/0kMrJrVoMxiL8bgfyiF+un/D
NONDTXWCiImx0uxJE8agUIPMGQcSHTI3D5PM9TEvNjZc3OlTWkMumbtXA5nMuukvutMiux0v
M9s8A4OZlQ18PUKm5tWAECZkYg1Jg8Vk4KPWdzPu1lTPhnjuMNbWFQQnlXkL+HoK79rhvuTM
uTx/QkaZXTP4aKPR7s80g2yn3sIy+N/gDrWcUuYDcHdKH59f4bI1MOW3ke9uBCMMcdGz59BN
uaOSwwX2er/RMpk3skJME7YRjNGZeq7AVGOlrSHBhZWgXsTtshyuO4wAvtMqjevd565IY5+J
erlnOOrDhiNgnGE+T0IZbAMzEertr4o5j+aDG1O3jYN0sOtVJku5UPyKqqL/l6LPfrDyMqnT
w/Xyevn+drP7/fJ4/XS4+fH++PrW0lXUiWDM0Ob128Trx/MoaU6ElggkKc1sNtWJcaYqKQ7c
Kxjd3BEOrJD08nekN356eb8yXoNV/PAiFtlitibnHVmJVoct/HVERgaBdu+1S1Mrj6Ik3sT3
cJ2VkQjS/ogMQbVbnXwTkXNTXXMef13eHl+ulwdys5CB6fBGQ3498bCq9OXX6w+yvjhIq9VA
19h6UpsfaPyHaUL6DAy07c9UxUWJnm8cjHhy84qipO91tsFacmP/err8gOL04lBROCiyMny9
Xu6/PVx+cQ+SdBVMKo8/b66Pj68P9zA6d5eruOtVUn7j3V44DqxZWAi0EexQXUpq8r8g55rZ
o+nhLvzz26Oirt/PTyhmqXuREmGLzMvRogwVe1mCgZ5pw9GP1y6rv3u/f4KOZHuapOvzxCna
FhHy4fz8dH7+j6uTotaa3Q9Nr6YBcYA3+k3i0UoRL8esLiQpgLXGmJEJ5tiIj0SI+OTuBsP+
EFGP+gFAMOCWoNd2rx6tObHt3LLKXuUWT88KxZTvTrBN/aOiFLViFFTxNHZ0N2D0Fcx4JQV5
qLxlJKlrJyhu0Xtnn64nA7VJbqxwPwJKbZ+xj0AUBi4TQW4Fd12VdQuGJsQ+/B0L80vj3C4m
Vhhg0BsmWbCOwi/l32nH8S4KvSJwg8WiKxKpAtS0RkWrAK24HE455/SV8/HjFa9c989wIv66
PJ/fLleKpTDBtMlk948s+/nb9XL+ps8cuKQmUdcxpdrUS7jGTdrUiRx2w5hhzIZKyFc/W4Zy
gL/6vPcR8/k9nJ9/kNECMyZKFeZzKboGtZUVR7/K5slNvKVFIRsmTlIqIlp+l/oi4JazjFrt
qLy6DAe2RwjNlrezLygFyxmOAzXNWifKwfaFa2ceNL+QOSiojNVAE6gq1oTPeTbp2LuXRUWO
+eK4bXhakDncgTLrVzeTjYpSkRe2wyRYLFGp5+wTTsIuQZwI+svanbQiqsNvFgxvCtaO7exa
fiSJJ6DfgMaY+H/hSTlPAr5xwtHWmeF1ofANj24m/JNAoVepPg76JEA2ujtsqqy0bYliarjx
ulrI8CZ6SNIAw0FmcBp36Xr74EzAJMSsq02KzhSdiVDTut52brdAqAKpo2y92O5fnjUOMmJS
A2L0wU0647pbkekVscG8AJtWphiHs6wt77nMW8ok1AVxDXHuH362E8VsUjm76VuXQiu4TPj5
GTMr487SbCxVR6bRCg69QtfVfIl84bV0pl8BxrR67256H1S1g363kpNE6eeNnX32cvw7zOjW
Aa3VsiCF51olhy4Ef1daU4ylHdtb7+/ZdEnRRYThKjH20h/n14tlzVefxnpSew26zza0EFB+
ALvCM2INV5u/qQcUq/D6+P7tcvOd6pnGj0kvuG37hMkyjH6QtbKTyWLsFzSxFpx7r0QBR+y7
CRkE/9ZL/r+yY1tuG9f9Smafzpnp2anTtE0f+iBLsq21bqGkOMmLJk28qafNZRzn7PZ8/QF4
kUkRoL0vTU1AvIIgAIJAaXdgdOHXFrXLcGTBgVNC4XgH014FmCV9LFI4Bu2a1R9+pol5HKrE
uMjIxfBuNC2cDlcCvZZ4JhwlAdiMh6WSMXLQBf8hgNCHlz1rAn2dBrrDg2IRFdxruIsuahYM
8DJwWhZZCQTAscAiMPqah12UV2dB6CceKkKN1k3LPXEHirnkPusC0y3Yo8SE0XTp0QBnLuPD
35eno98fHFlclrB7TYLp2w8EoRco0UeBMdrKcUeSrMGMGnAY1JSLNKBQPhNzEYHeWGOYd+tp
KooT45/QUbdBZde0mE9XitGLPlkSyCQap/WCXoc4k+e59QsNsG1jzbYsxMeFKxBFpEybajuy
w5gQa5VGy75eofM2Y6NFrK6OuawvEs7xRAn0LgT2pbTau4fjQ9C6Zx/IKcQj+tesyiBOlUQ8
r+T2Q26TWd6Yw9g5rS2wOe57OO4d8rNhnz/Q96ku0mf6rs5BOmeer46Q6BUYIR3V3BEd51wy
R0j05d8I6ZiOM64PIySGy7hIx0zBJ/qWdYREX6I6SF8+HFHTl2MW+Atzh+8inR3Rp3PG8QeR
QP5Ggu9pGdSpZnJ6TLfZvKaIFTVxltEbcujJZLzDDICfDoPB04zBODwRPLUYDH6BDQa/nwwG
v2rDNBwezOTwaCb8cJZVdt4zud0NmHZMRXARxSjgcBkZNEacokf/AZSyTTtBG3gHJFFFLRfb
ZkC6FlmeH2huHqUHUUTKvEk0GFmMuQPpBykDTtlltOHOmb5Dg2o7seTuYBGHVR+7MotHEW81
JKv61YXcZCbwjG0Z1Alc7t62m90vy91gUM6uHV0Gf/cCI0jg7bdvOTDiLibIBsGzlMm3RFbO
GSFWGXfShJccANAnCwwVpB5pM2qENgf2SZE28nKkFRljSQ2aDg2QFCRk6iaZmKKELqPNKK7q
aym/xWjIcqI5jNFo8xVIuGh/aqqOSyIo3+zGshqM6aRCOhGdMxaG/VREloNs3hRff8OEwXiT
/g7/uX/+6+ndr9vHW/h1e/+yeXr3evvnGirc3L9Dj9wHpIh3317+/E0RyXK9fVr/lJGg1k9o
Kt8Tix13fvO02W1uf27+d4tQy0BUZi2OJV5iKhhH75agqlTzyLiqe8gz2LYsrhtffdwlA+ZH
tE9qM9oYg7iMZFsZh4J4++tl93xy97xdnzxvT76vf76st/uhK2TM+OCEkXGKT/3yNErIQh+1
WcZZvbCf2o0A/ieoRZCFPqqwbbb7MhJxEK29jrM9ibjOL+vax4ZCvwZMIOOjArsFCcWvV5c7
lwAaNH6qQn44aKnoKt541c9nk9NzJ6aRBmB2IrKQ6on8Qx85ZtRduwD+GUIhfdnrt28/N3f/
+bH+dXIn6fYBI0b98shVNBHRr4R6JqthaRx740vjZEFUA8UNbUIfEMQBjKZgdFI9gZ24TE8/
fpx88WYgett9Xz/tNne3u/X9SfokpwEDGP612X0/iV5fn+82EpTc7m69eYnt2FZmzeOCWsMF
HJDR6fu6yq8nHxh/82FjzzN0fg2OOL1gXlIPk7aIgD9eeiOeSv+px+d71/hv+jkNUlE8o1IU
G2ArqJG3pD3E9HJKfJILOqKRBlcz+rJfg+sDY7hqOcuk4irp9Uowl+9mgdDHr+3o22UzsqYh
Jn+BL93M3I/mqYj8LbNQhd4QDgzxEj7z2k42D+vXnd+uiD+cUo1IQHAir3j7k8KY5tEyPQ2u
lkIJrgh0pJ28T7IZT0dzfYZ5tEBstxEjT84su5wp++jcvQ2lGOIr1NMig10nnU2CaKJIJoxR
xWzvRUSr0hZ83BkP4/TjJ18KWEQfJ9QhAwBa7RxYbBjcggw2ZZKQa5xVDU17ZBlvXr47Lt0D
F2yIbkJpz8TfGQiqWvG+q5qioiIFfTF4psRR0wbZNCLQBgFzPjKxZzR4Jv8GW9CHRvggEDX3
wHJYOtpaYCSDVTWeLx3c8/Flu359VaK7P7hZzmU/Nmz8hlbtNficeXUwfB3sNYAXwU1207R+
dAABWs/z40n59vhtvVUevUY38SitbLI+rkVJ+YKYSRDTuXEWJyAM91awA6xTIsW0fX6P4bX7
R4ZPW1P0BKyvGakWI1gebH9ANHrDUciCcSgf46Huwo8M+9br3JC2UvVz8217C0rc9vltt3ki
zlBMuqb4BlEu4jNK1simx5xBiKa240EsUtj08YA7eAcPlpsjC4RuDDE5IRs5Rozcd5kWO33s
4cwYV7VYER9GzXWBIZOzWBpmMLbOfuItYN1Nc43TdFMX7erj+y99nKLhI4vRE025oTmeBcu4
OcdoZJcIx1pYVzVE/Qz7sWnQHE1X9VlqQj0X/xCzcKYYhU35IaE/kexZRryWj9fbHfokg37w
KoMtvG4enm53b6D5331f3/3YPD3sKVRdvqrsqcrGJRwHKB/efP3NchzR8PSqFZE9Y5zlqsL0
utfj9mhsVTXsAgxc0LQ0snHAOWLQZkzTrMQ+yMi2M7OXc38T7xcokm5fxNJOMxAw8AWQRTzG
eRlkjzKur/uZqArjvUWg5GnJQMsUnXEy+2owrkTiPifDeHgp6OjFlH6HFGPs+hjYr8194slo
O8W9L8o64KzteioIhZTGR3V9OIWVzmdj1d5FgL2XTq/PiU8VhDtlJUokVvwhjxhTxtINUOaK
DiAsgAmskk2VksJ9dk6MXiknjqemzF8cnrMbmbazlKKNZTC9QXkHLUsYttUuPyPLUfQgAVc3
WDz+3V+df/LKpBN47eNm0aczrzASBVXWLoBaPUADjNGvdxr/YU+WLmWmaT+2fn6TWVY4CzAF
wCkJyW+KiARc3TD4FVN+Rpbj9Pub3LbMD4dUU8UZMPfLFKZLRJYzKIbFyyrHPV0VyTDgjjs0
lif2iMoUGG4jn1BiXNV5uxjBEABVSHO+He4eihMMsS4w2P1CinFWZ020PvnoE3FnlfACqdNY
cd0RKAiFGauJxhBUVqUB9IUzYoQOoLqqchckUg87yQRG1icgKA0aXxOqGCbSpkszddO0jEG8
FlSQsmaeq9W2qryw+jjPK8fqhL9DTKHM0VGGoCgZmsXejnF+07eRU3kmLlBao1INF3XmRGuB
H7PEWoRKxrydw4ksHMoEajVduEyayu/YPG0x6FE1S2yStr+RQZF6O0b+rIK1JPyssJz0UUb8
87/PRzWc/z2xeFkzH5HHQHs1vulwrkAGEEAknehc8LCUIJMReJ0Kr9PP8q5ZGL98G0neMK2i
3Aq82MB5pUjQulNDWYdc/0Ho8WQW9xbMiHqy9GW7edr9kBEb7h/Xrw/+RaqK9C+XYCRgYDH6
OzHalhxQKz3cpl2WJz0Z4D3WWSbyap6DyJQP9zCfWYyLDp2zh2D2RoL2ajizNqJOm8A7wzkY
XlqfQfYsphWqB6kQgG5zQ533fK4TJNjX1uwcD4aLzc/1f3abRy2UvkrUO1W+pV7Sq9ZQ56Ro
HXN49KtIlF8n70/PXNqp4RjBV0sF9zYvSuQNEWCRCIsUU3o26PPXRiSf0HwQGChoIeheXGB+
WYuoRxDZ074qc8cAoGqB0wCoZ9aV6hO5t3rvqbX+5LLIs7K76rlAkXaVyiWRimk2pDM5clWc
d9l6jyXrb28PD3gvmz297rZvj+unnbWjZPRx1GPExX5arMLhcjgtcS2+vv97QmGpNBJ0DTrF
hMmYgbqZOwvNmHQHb84oz4mFUB6uEqHA91yhGTY14W0554sgWd5ynjinD/6mVPeBh06bqAQx
v8za7CYd91RCufZAl4ZPkUeDoizs3XnU2rlzhY7/aT6eQfSk/+qmsh8qc9VGYFagGWOIfMZV
QFWIiFIyoD1VsJpqVTLcV4LrKsMEAowmvW8F9j2t4ymUavpHGjP3UHq75xG1cnLq9ZzBQZnD
rvNpy0BC1Uvviw7ZPH3UwHGaaKy0lBk3yICwe2FSVntZ9PW8jUappA0s0J/9h0c0otJ4ES0E
8ntpipIvvqXjSHhy5cjx9dQM9p3fkgMO78iosQN+jwB4U+dKqnEsR6qg+6g2LhRd+lFoKav9
1k0SrWvuN38U2L6qDzPJy+xvZn6sHNeDZr8DvUlZ4At279oR8U+q55fXdyf5892PtxfF9xe3
Tw8j408J3BYOpYp+OOjA8e1qB4zcothq1qJjf1frPF7MGySd5GvRwfy1UUNvktUFmcR9gEsb
omqNnKvwoJWjHZyB928yPLfF05zt5/ngy2L5boBslapyvEgodS7TtKbNbJqBiTQt6iFGCg7A
4uL/en3ZPKETAYzt8W23/nsN/1nv7n7//fd/W7FZ8QWorG4uxWtfs6gFBibSLz1pww/WgcMN
7GjUxrs2vUopktF0qePReMeL+s7f3auVggETrlaggjARm1T7qyZlRD+FIAfBHzoKyUT5zGFl
DtSFsynvZbTCQrctW4Ut0OIrEl+vMWQ+DJTUfgaqmwWqMirSPyAST+wWF7M8mlMruFd57GWS
Ai7Mad+VmCEDtooy7gWmbqmOXIY9/VCiyv3t7vYEZZQ7NGgTCgKax0Mn/wF4ExIb5CvjjEvR
KaWGsk+iFm0vQnTEO2iH+TBDGrcaC5i/sgXZlohUFHe0wAUAoIooD5AWohykP0QCQYmpy0IC
paKX6pHkX1XXfj2d2HCPQrAwvWgo9dTEPXIG57GAC63XCD5Ks9ZQ5VYD6RNtcUyg4whE0/h6
lJnKWJeqWnVfjKSEQUkLQ+ciqhc0jtHAZ2Z6nAqUIaGQwSRgFfDGY4SCz3zlnCMmSL6l7eIo
MWL9oaplD1TdwYCw/aht1Wrs8mNpgVFJMveFMvGgxHcuyuBPi7OtEnV4A/fwjdmLQfSjKM88
YppWlTSomW/IRR4tF2/ACSEAJwQ5ZhZC0YczgeLIDsNw94aGFdBhqOaqKUG7SUMoMpb6gWo0
YWnioZi6po6mjGoMuW53cgQyFgXu6egU+D4QAYgS8rp27E1uyqOyxBytMC3qA8YxZ0AHmqcQ
TaP5UsaQzqoxcXdQwzRVlGvbA/Q+HJePsK0L2bJd6HLaZoS3tCbwPb1Qcg3UFsrK8cnnosmd
TVvU9/x0v0MPYJqWo1wa6tnolIZM2ggOiTpwRlgt/yPkIbqN3LpJmrcRt+xyR2XSToTRMnhJ
KMLUPhRNWCqqDFeUaZNNaifIle9QNIZzR1C5MO8gfnn+a719uWOsH/gkWbuhr1IhKtI1ApAU
0CY/XHfFk5K0bheYz9SpFiOky21D6BwDO07Q1QJYMW9F3684kMMVrF8QrWgwi1ArL8hCeFdc
LpFpkhFpnBxuDscSnCHMPKWRyK/Hl1IjAIb/mqfx0smVMsaBpYy5V0qIW7f4UpqUTvwVt68c
2vXrDqVsVCnj5/+ut7cPa5skll3JvUDTQmYvaUGzBjagjopoQuGMyX4ZV5eemaIBFlpdao7g
PqVHfErWAylCHrSw6EhP40Cs+TJhgnpJjbzIShmxlsdoKiaxloQm2SXjtTAdbl6QJgMMaIqO
sAG4vBuu8gpDqLJYMgIYctBwZXA44tnIws0FZXgfyZEv0iufFp2JU9dk6skZc+ZovCZmXrgp
zyvAaJmoaBJBuQsFWoijMgBWrIOHd904ap0NvZJ+ADycsvm5GAL9TjxL5mi2OedLCYVTK2B0
YtLvmLFX43DNNlxbGwOT08g09aH1m9ahyUcfsoXKcU8/T5llZdLLvHBhKQJrm2WiAFU/MJEq
EFFgPPJAD1GrfFDJvjhVFFtUAYpBJg8CcXDrSLc2hiObSsII8okjXiywwgfGDINqENvmmLqI
PGSCp4n3MlLdcv8faktiWvkIAQA=

--a8Wt8u1KmwUX3Y2C--
